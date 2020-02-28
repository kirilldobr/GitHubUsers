//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

class UserListViewModel: TableViewModel {
    override init() {
        super.init()
        
        pullToRefresh
            .flatMapLatest { NetworkManager.getUsers(since: nil) }
            .do(onNext: { [weak self] _ in self?.endRefreshing.accept(()) })
            .map { $0.map { user in UserCardViewModel(user: user) } }
            .debug()
            .bind(to: elements)
            .disposed(by: aliveDisposeBag)
        
        reachedBottom
            .withLatestFrom(elements)
            .map { $0.last as? UserCardViewModel }
            .map { $0?.user.id }
            .flatMapLatest { NetworkManager.getUsers(since: $0) }
            .map { $0.map { user in UserCardViewModel(user: user) } }
            .bind { [weak self] newModels in
                self?.elements.accept((self?.elements.value ?? []) + newModels)
            }
            .disposed(by: aliveDisposeBag)
    }
}
