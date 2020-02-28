//
//  FavoritesStorage.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import RxCocoa
import RxSwift
import Shallows
import UIKit

class FavoritesStorage {
    static let shared = FavoritesStorage()
    
    let users = BehaviorRelay<[Int: User]>(value: [:])
    
    init() {
        users.accept(getStoredUsers())
    }
    
    lazy var usersList =
        DiskStorage
        .main
        .folder("shallows", in: .cachesDirectory)
        .singleKey("favorites")
        .mapJSONObject([Int: User].self)
        .defaulting(to: [:])
        .makeSyncStorage()
    
    func getStoredUsers() -> [Int: User] {
        return (try? usersList.retrieve()) ?? [:]
    }
    
    func toggle(user: User) {
        if users.value[user.id] != nil {
            remove(userID: user.id)
        } else {
            add(user: user)
        }
    }
    
    func add(user: User) {
        var current = getStoredUsers()
        
        current[user.id] = user
        
        try? usersList.set(current)
        
        users.accept(current)
    }
    
    func remove(userID: Int) {
        var current = getStoredUsers()
        current.removeValue(forKey: userID)
        try? usersList.set(current)
        
        users.accept(current)
    }
}
