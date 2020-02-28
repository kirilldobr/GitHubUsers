//
//  UserTitleView.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import UIKit

class UserTitleView: View<UserTitleViewModel> {
    let usernameLabel = UILabel()
    let accountTypeLabel = UILabel()
    
    override func didLoad() {
        super.didLoad()
        
        addSubview(usernameLabel, layout: Top(), Bottom(), Left())
        addSubview(accountTypeLabel, layout: Top(), Bottom(), Left(12).to(usernameLabel), Right())
        
        let usernameLabelFont = UIFont.systemFont(ofSize: 16)
        usernameLabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: usernameLabelFont)
        usernameLabel.adjustsFontForContentSizeCategory = true
        usernameLabel.textColor = .black
        
        let userTypeFont = UIFont.systemFont(ofSize: 12)
        accountTypeLabel.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: userTypeFont)
        accountTypeLabel.adjustsFontForContentSizeCategory = true
        
        usernameLabel.setContentHuggingPriority(.required, for: .horizontal)
        accountTypeLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    override func setModel(_ viewModel: UserTitleViewModel) {
        super.setModel(viewModel)
        
        usernameLabel.text = viewModel.username
        accountTypeLabel.text = viewModel.accountType
        accountTypeLabel.textColor = viewModel.accountTypeLabelBackgroundColor
    }
}
