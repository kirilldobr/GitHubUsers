//
//  UserAvatarView.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import UIKit

class UserAvatarView: View<UserAvatarViewModel> {
    private let imageView = UIImageView()
    private let adminLabel = UILabel()
    
    override func didLoad() {
        super.didLoad()
        
        addSubview(imageView, layout: Edges())
        addSubview(adminLabel, layout: Bottom(), CenterX(), Width(54), Height(16))
        
        let adminLabelFont = UIFont.systemFont(ofSize: 10)
        adminLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: adminLabelFont)
        adminLabel.adjustsFontForContentSizeCategory = true
    }
    
    override func setModel(_ viewModel: UserAvatarViewModel) {
        super.setModel(viewModel)
        adminLabel.isHidden = viewModel.adminLabelIsHidden
        adminLabel.text = viewModel.adminText
        imageView.sd_setImage(with: URL(string: viewModel.imageURL))
    }
}