//
//  UserCardView.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import RxSwift
import SDWebImage
import UIKit

class UserCardView: View<UserCardViewModel> {
    private let userAvatarView = UserAvatarView()
    private let userTitleView = UserTitleView()
    private let urlLabel = UILabel()
    
    private let favoritedButton = UIButton()
    
    override func didLoad() {
        super.didLoad()
        
        let horizontalStackView = UIStackView()
        
        let verticalStackViewHolderView = UIView()
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        
        verticalStackViewHolderView.addSubview(verticalStackView, layout: Left(), Right(), CenterY())
        
        verticalStackView.addArrangedSubview(userTitleView)
        verticalStackView.addArrangedSubview(urlLabel)
        
        horizontalStackView.addArrangedSubview(userAvatarView)
        horizontalStackView.addArrangedSubview(verticalStackViewHolderView)
        horizontalStackView.addArrangedSubview(favoritedButton)
        
        favoritedButton.easy.layout(Width(46))
        userAvatarView.easy.layout(Width(54))
        
        addSubview(horizontalStackView, layout: Edges())
    }
    
    override func setModel(_ viewModel: UserCardViewModel) {
        super.setModel(viewModel)
        
        userAvatarView.setModel(viewModel.userAvatarViewModel)
        userTitleView.setModel(viewModel.userTitleViewModel)
        urlLabel.text = viewModel.url
    }
}
