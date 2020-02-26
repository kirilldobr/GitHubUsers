//
//  HasViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

protocol HasViewModel {
    associatedtype Model: ViewModel

    func setModel(_ viewModel: Model)

    init()
    init(viewModel: Model)
}

extension HasViewModel {
    init(viewModel: Model) {
        self.init()
        setModel(viewModel)
    }
}

protocol HasAnyViewModel {
    func setAnyModel(_ model: Any)
}
