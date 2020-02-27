//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

class UserListViewModel: ViewModel {
    let tableViewModel = TableViewModel()
    
    override init() {
        super.init()
        
        NetworkManager.getUsers(since: nil).map { users in
            print(users)
            return users.map { user in UserCardViewModel(user: user) }
        }
        .bind(to: tableViewModel.elements)
        .disposed(by: aliveDisposeBag)
    }
}
