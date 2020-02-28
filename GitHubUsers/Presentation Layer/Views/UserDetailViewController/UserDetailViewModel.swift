//
//  UserDetailViewModel.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

class UserDetailViewModel: ViewModel {
    let username: String
    let pageURL: String
    
    init(user: User) {
        username = user.login
        pageURL = user.pageURL
    }
}
