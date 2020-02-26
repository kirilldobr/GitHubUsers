//
//  View.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class View<Model: ViewModel>: UIView, HasViewModel, HasDisposeBag {
    let aliveDisposeBag = DisposeBag()
    var disposeBag = DisposeBag()

    func setModel(_: Model) {
        disposeBag = DisposeBag()
    }

    func didLoad() {}

    required convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
