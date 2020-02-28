//
//  ErrorViewModel.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class ErrorViewModel: ViewModel {
    let buttonTitle = BehaviorRelay<String?>(value: nil)
    let textTitle = BehaviorRelay<String?>(value: nil)
    let isHidden = BehaviorRelay<Bool>(value: true)
    
    let buttonPressed = PublishRelay<Void>()
}
