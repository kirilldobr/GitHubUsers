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
    let imageView = UIImageView()
    let loginLabel = UILabel()
    let url = UILabel()
    let accountTypeLabel = UILabel()
    let adminStatusLabel = UILabel()
    
    override func didLoad() {
        super.didLoad()
        
        addSubview(imageView, layout: Top(), Bottom(), Left(), Width(40))
    }
    
    override func setModel(_ viewModel: UserCardViewModel) {
        super.setModel(viewModel)
        
        imageView.sd_setImage(with: URL(string: viewModel.avatarURL), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
