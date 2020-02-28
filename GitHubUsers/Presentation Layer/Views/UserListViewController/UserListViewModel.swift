//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import RxOptional
import RxSwift
import RxSwiftExt
import UIKit

class UserListViewModel: TableViewModel {
    let errorViewModel = ErrorViewModel()
    
    let refreshing = PublishRelay<Bool>()
    
    override init() {
        super.init()
        
        errorViewModel.buttonPressed
            .do(onNext: { [weak self] in
                self?.refreshing.accept(true)
                self?.errorViewModel.isHidden.accept(true)
            })
            .bind(to: pullToRefresh)
            .disposed(by: aliveDisposeBag)
        
        errorViewModel.buttonTitle.accept("Refresh")
        
        // when doing pull to refresh - don't use cache to show actual network status
        pullToRefresh
            .flatMapLatest { NetworkManager.shared.getUsers(since: nil, cache: false) }
            .bind { [weak self] event in
                self?.endRefreshing.accept(())
                self?.refreshing.accept(false)
                
                switch event {
                case let .next(users):
                    self?.errorViewModel.isHidden.accept(true)
                    
                    let userModels = users.map { user in UserCardViewModel(user: user) }
                    self?.elements.accept(userModels)
                    
                case let .error(error):
                    self?.errorViewModel.textTitle.accept(error.localizedDescription)
                    self?.errorViewModel.isHidden.accept(false)
                    self?.elements.accept([])
                    
                case .completed:
                    break
                }
            }
            .disposed(by: aliveDisposeBag)
        
        reachedBottom
            .debug()
            .withLatestFrom(elements)
            .map { $0.last as? UserCardViewModel }
            .map { $0?.user.id }
            .flatMapLatest { NetworkManager.shared.getUsers(since: $0) }
            .bind { [weak self] event in
                self?.endRefreshing.accept(())
                
                switch event {
                case let .next(users):
                    self?.errorViewModel.isHidden.accept(true)
                    
                    let userModels = users.map { user in UserCardViewModel(user: user) }
                    self?.elements.accept((self?.elements.value ?? []) + userModels)
                case .error(_), .completed:
                    break
                }
            }
            .disposed(by: aliveDisposeBag)
    }
}
