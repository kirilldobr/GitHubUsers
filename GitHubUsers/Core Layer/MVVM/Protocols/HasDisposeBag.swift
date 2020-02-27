//
//  HasDisposeBag.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxSwift
import UIKit

protocol HasDisposeBag {
    var disposeBag: DisposeBag { get set }
    var aliveDisposeBag: DisposeBag { get }
}
