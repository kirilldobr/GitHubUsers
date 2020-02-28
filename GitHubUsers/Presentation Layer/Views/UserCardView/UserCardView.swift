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
        
        backgroundColor = .white
        
        let horizontalStackView = UIStackView()
        
        let verticalStackViewHolderView = UIView()
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        
        verticalStackViewHolderView.addSubview(verticalStackView, layout: Left(), Right(), CenterY(), Top(>=0), Bottom(>=0))
        
        verticalStackView.addArrangedSubview(userTitleView)
        verticalStackView.addArrangedSubview(urlLabel)
        verticalStackView.spacing = 5
        
        horizontalStackView.addArrangedSubview(userAvatarView)
        horizontalStackView.addArrangedSubview(verticalStackViewHolderView)
        horizontalStackView.addArrangedSubview(favoritedButton)
        horizontalStackView.spacing = 10
        favoritedButton.easy.layout(Width(46))
        userAvatarView.easy.layout(Width(54))
        
        let urlLabelFont = UIFont.systemFont(ofSize: 12)
        urlLabel.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: urlLabelFont)
        urlLabel.adjustsFontForContentSizeCategory = true
        urlLabel.textColor = .blue
        
        addSubview(horizontalStackView, layout: Top(11), Bottom(11), Left(16), Right(16))
    }
    
    override func setModel(_ viewModel: UserCardViewModel) {
        super.setModel(viewModel)
        
        userAvatarView.setModel(viewModel.userAvatarViewModel)
        userTitleView.setModel(viewModel.userTitleViewModel)
        urlLabel.text = viewModel.pageURL
    }
}
