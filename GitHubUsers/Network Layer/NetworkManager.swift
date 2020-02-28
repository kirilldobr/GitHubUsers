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
    static let shared = NetworkManager()
    
    func getUsers(since: Int?, cache: Bool = true) -> Observable<Event<[User]>> {
        let parameters: [String: Any]?
        
        if let since = since {
            parameters = ["since": since]
        } else {
            parameters = nil
        }
        
        func requestWithCachePolicy(cache: Bool, urlString: String, parameters: [String: Any]?) -> URLRequest? {
            guard let url = URL(string: urlString) else { return nil }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.cachePolicy = cache ? .useProtocolCachePolicy : .reloadIgnoringCacheData
            return try? URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return Observable.create { [] observer -> Disposable in
            
            guard let encodedRequest = requestWithCachePolicy(cache: cache,
                                                              urlString: Endpoint.users,
                                                              parameters: parameters) else {
                observer.onError(GetUsersFailureReason.notFound)
                observer.onCompleted()
                return Disposables.create()
            }
            
            request(encodedRequest)
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
                            let users = try JSONDecoder().decode([User].self, from: data)
                            observer.onNext(users)
                            users.forEach { print("\($0.login) \($0.isAdmin)") }
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                            observer.onCompleted()
                        }
                    case let .failure(error):
                        observer.onError(error)
                        observer.onCompleted()
                    }
                }
            
            return Disposables.create()
        }.materialize()
    }
}
