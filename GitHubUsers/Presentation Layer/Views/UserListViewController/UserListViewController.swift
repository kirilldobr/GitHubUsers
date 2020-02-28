//
//  UserListViewController.swift
//  GitHubUsers
//
//  Created by dk on 26/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import UIKit

class UserListViewController: ViewController<UserListViewModel> {
    let tableView = TableView<TableViewModel>()
    
    override func setModel(_ viewModel: UserListViewModel) {
        super.setModel(viewModel)
        
        tableView.setModel(viewModel.tableViewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GitHub Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.tableView.rowHeight = 75
        
        view.addSubview(tableView, layout: Edges())
    }
}
