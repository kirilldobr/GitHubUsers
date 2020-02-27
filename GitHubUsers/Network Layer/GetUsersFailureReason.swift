//
//  GetUsersFailureReason.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

enum GetUsersFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}
