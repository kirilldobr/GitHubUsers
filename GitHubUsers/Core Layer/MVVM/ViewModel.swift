//
//  ViewModel.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

class ViewModel: HasDisposeBag {
    let aliveDisposeBag = DisposeBag()
    var disposeBag = DisposeBag()
}
