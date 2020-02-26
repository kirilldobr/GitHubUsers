//
//  RegistrableCellType.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import Foundation

protocol HasReuseID {
    static var cellReuseIdentifier: String { get }
}

extension HasReuseID where Self: HasViewModel {
    static var cellReuseIdentifier: String {
        return String(describing: Model.self)
    }
}
