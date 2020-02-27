//
//  UserCardViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

class UserCardViewModel: ViewModel {
    let login: String
    let isAdmin: String
    let userType: String
    let avatarURL: String
    
    init(user: User) {
        login = user.login
        isAdmin = user.isAdmin ? "admin" : "regular"
        userType = user.accountType.rawValue
        avatarURL = user.avatarURL
    }
}
