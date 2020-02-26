//
//  UITableView+Extensions.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

extension UITableView {
    static let globalAssociation: [IsTableCellWithReuseID.Type] = [
    ]

    func register(cellClass: IsTableCellWithReuseID.Type) {
        register(cellClass.self, forCellReuseIdentifier: cellClass.cellReuseIdentifier)
    }
}
