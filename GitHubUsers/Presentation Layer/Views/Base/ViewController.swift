//
//  ViewController.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import RxSwift
import UIKit

class ViewController<Model: ViewModel>: UIViewController, HasViewModel, HasDisposeBag {
    let aliveDisposeBag = DisposeBag()
    var disposeBag = DisposeBag()
    
    func setModel(_: Model) {
        disposeBag = DisposeBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
