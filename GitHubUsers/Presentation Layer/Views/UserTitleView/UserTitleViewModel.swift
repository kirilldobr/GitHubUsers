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
    let accountType: String
    
    let accountTypeLabelBackgroundColor: UIColor
    
    init(username: String, accountType: AccountType) {
        self.username = username
        self.accountType = accountType.rawValue
        
        switch accountType {
        case .user: accountTypeLabelBackgroundColor = .lightGray
        case .organization: accountTypeLabelBackgroundColor = .orange
        }
    }
}
