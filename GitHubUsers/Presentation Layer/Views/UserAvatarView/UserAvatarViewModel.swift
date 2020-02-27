//
//  UserAvatarViewModel.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

class UserAvatarViewModel: ViewModel {
    let adminText = "Admin"
    let imageURL: String
    let adminLabelIsHidden: Bool
    
    init(imageURL: String, adminLabelIsHidden: Bool) {
        self.imageURL = imageURL
        self.adminLabelIsHidden = adminLabelIsHidden
    }
}
