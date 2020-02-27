//
//  UserTitleViewModel.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

class UserTitleViewModel: ViewModel {
    let username: String
    let userType: String
    
    init(username: String, userType: String) {
        self.username = username
        self.userType = userType
    }
}
