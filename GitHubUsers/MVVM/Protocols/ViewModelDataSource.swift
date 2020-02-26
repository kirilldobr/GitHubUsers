//
//  ViewModelDataSource.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import UIKit

protocol ViewModelDataSource {
    associatedtype VM
    
    var elements: BehaviorRelay<[VM]> { get }
}
