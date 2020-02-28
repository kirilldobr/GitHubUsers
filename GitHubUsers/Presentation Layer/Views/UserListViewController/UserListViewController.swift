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
    
    override func setModel(_ viewModel: UserListViewModel) {
        super.setModel(viewModel)
        
        tableView.setModel(viewModel)
        
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
        // navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.tableView.rowHeight = UITableView.automaticDimension
        tableView.tableView.estimatedRowHeight = 75
        
        view.addSubview(tableView, layout: Edges())
    }
}
