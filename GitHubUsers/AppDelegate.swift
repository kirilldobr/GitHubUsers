//
//  AppDelegate.swift
//  GitHubUsers
//
//  Created by dk on 26/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var userListViewModel = UserListViewModel()
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeViewController = UserListViewController()
        
        homeViewController.setModel(userListViewModel)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
