//
//  UserCardViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class UserCardViewModel: ViewModel {
    let userAvatarViewModel: UserAvatarViewModel
    let userTitleViewModel: UserTitleViewModel
    
    let pageURL: String
    
    let user: User
    
    let isFavorited: Observable<Bool>
    
    let favoritePressed = PublishRelay<Void>()
    
    init(user: User) {
        self.user = user
        
        isFavorited = FavoritesStorage.shared.users
            .map { $0[user.id] != nil }
        
        userAvatarViewModel = UserAvatarViewModel(imageURL: user.avatarURL,
                                                  adminLabelIsHidden: !user.isAdmin)
        userTitleViewModel = UserTitleViewModel(username: user.login,
                                                accountType: user.accountType)
        pageURL = user.pageURL
        
        super.init()
        
        favoritePressed
            .bind { FavoritesStorage.shared.toggle(user: user) }
            .disposed(by: aliveDisposeBag)
    }
}
