//
//  UIView+Extensions.swift
//  GitHubUsers
//
//  Created by dk on 26/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import UIKit

extension UIView {
    func addSubview(_ view: UIView, layout attributes: Attribute...) {
        addSubview(view)
        view.easy.layout(attributes)
    }
}
