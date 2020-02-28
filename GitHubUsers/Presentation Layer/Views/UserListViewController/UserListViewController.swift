//
//  UserListViewController.swift
//  GitHubUsers
//
//  Created by dk on 26/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import RxSwift
import UIKit

class UserListViewController: ViewController<UserListViewModel> {
    let tableView = TableView<TableViewModel>()
    
    let spinner = ActivityIndicatorView()
    
    override func setModel(_ viewModel: UserListViewModel) {
        super.setModel(viewModel)
        
        tableView.setModel(viewModel)
        
        provideErrorViewModel(viewModel.errorViewModel)
        
        Observable.combineLatest(viewModel.refreshing, viewModel.errorViewModel.isHidden)
            .map { refreshing, errorHidden in refreshing || !errorHidden }
            .observeOn(MainScheduler())
            .bind(to: tableView.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.refreshing
            .observeOn(MainScheduler())
            .bind { [weak self] refreshing in
                if refreshing {
                    self?.spinner.startAnimating()
                } else {
                    self?.spinner.stopAnimating()
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.modelSelected
            .observeOn(MainScheduler())
            .bind { [weak self] vm in
                // could have used a generic in TableViewModel
                // but that would probably make things too complicated
                guard let userModel = vm as? UserCardViewModel else { return }
                
                let userDetailViewModel = UserDetailViewModel(user: userModel.user)
                let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
                self?.navigationController?.pushViewController(userDetailViewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GitHub Users"
        
        view.addSubview(tableView, layout: Edges())
        
        view.addSubview(spinner, layout: Center())
        
        spinner.hidesWhenStopped = true
    }
}
