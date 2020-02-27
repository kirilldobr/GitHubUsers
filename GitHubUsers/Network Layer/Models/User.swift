//
//  User.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

// Login as text
// 7.2. Avatar as an image
// 7.3. Github url as text
// 7.4. Account type as text
// 7.5. Site admin status as text

struct User: Codable {
    let id: Int
    let url: String
    let accountType: AccountType
    let isAdmin: Bool
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case isAdmin = "site_admin"
        case id
        case url
        case accountType = "type"
    }
}
