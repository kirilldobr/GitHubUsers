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
    let userAvatarViewModel: UserAvatarViewModel
    let userTitleViewModel: UserTitleViewModel
    
    let url: String
    
    init(user: User) {
        userAvatarViewModel = UserAvatarViewModel(imageURL: user.avatarURL,
                                                  adminLabelIsHidden: !user.isAdmin)
        userTitleViewModel = UserTitleViewModel(username: user.login, accountType: user.accountType)
        url = user.url
    }
}
