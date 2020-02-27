//
//  NetworkManager.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import Alamofire
import RxSwift
import UIKit

class NetworkManager {
    static func getUsers(since: Int?) -> Observable<[User]> {
        let parameters: [String: Any]?

        if let since = since {
            parameters = ["since": since]
        } else {
            parameters = nil
        }

        return Observable.create { observer -> Disposable in
            Alamofire.request(Endpoint.users, parameters: parameters)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided by alamofire return .notFound error instead.
                            // .notFound should never happen here?
                            observer.onError(response.error ?? GetUsersFailureReason.notFound)
                            return
                        }
                        do {
                            let friends = try JSONDecoder().decode([User].self, from: data)
                            observer.onNext(friends)
                        } catch {
                            observer.onError(error)
                        }
                    case let .failure(error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetUsersFailureReason(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                }

            return Disposables.create()
        }
    }
}
