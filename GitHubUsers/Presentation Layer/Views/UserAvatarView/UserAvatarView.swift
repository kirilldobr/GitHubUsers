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
        
        addSubview(imageView, layout: Left(), Right(), Width().like(imageView, .height), CenterY())
        addSubview(adminLabel, layout: Bottom().to(imageView, .bottom), CenterX(), Width(54), Height(16))
        
        adminLabel.font = UIFont.systemFont(ofSize: 10)
        adminLabel.textAlignment = .center
        adminLabel.backgroundColor = UIColor.purple
        adminLabel.layer.cornerRadius = 5
        adminLabel.layer.masksToBounds = true
        adminLabel.backgroundColor = UIColor(red: 147 / 255, green: 117 / 255, blue: 255 / 255, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
    }
    
    override func setModel(_ viewModel: UserAvatarViewModel) {
        super.setModel(viewModel)
        adminLabel.isHidden = viewModel.adminLabelIsHidden
        adminLabel.text = viewModel.adminText
        imageView.sd_setImage(with: URL(string: viewModel.imageURL))
    }
}
