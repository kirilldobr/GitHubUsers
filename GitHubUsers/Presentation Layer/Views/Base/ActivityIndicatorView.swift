//
//  Spinner.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIActivityIndicatorView {
    init() {
        super.init(frame: .zero)
        
        hidesWhenStopped = true
        
        style = .medium
        color = .black
    }
    
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
