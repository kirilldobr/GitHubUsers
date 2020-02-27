//
//  API.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

struct Endpoint {
    private static let base = "https://api.github.com"

    static var users: String {
        return base + "/users"
    }
}
