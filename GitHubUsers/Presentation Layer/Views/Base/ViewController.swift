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
    
    let errorLabel = UILabel()
    
    func setModel(_: Model) {
        disposeBag = DisposeBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        errorLabel.isHidden = true
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
    }
    
    var shouldHaveErrorLabel: Bool = false {
        didSet {
            if shouldHaveErrorLabel {
                view.addSubview(errorLabel, layout: Center())
                view.layoutIfNeeded()
            } else {
                errorLabel.removeFromSuperview()
            }
        }
    }
    
    func showError(message: String) {
        view.bringSubviewToFront(errorLabel)
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func hideError() {
        errorLabel.text = nil
        errorLabel.isHidden = true
    }
}
