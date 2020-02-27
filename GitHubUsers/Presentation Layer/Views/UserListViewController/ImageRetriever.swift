//
//  ImageRetriever.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import Foundation
import Kingfisher
import RxSwift
import UIKit

// extension URL {
//    var retrieveImage: Observable<UIImage> {
//        return Observable.create { observer in
//            let imageTask = KingfisherManager.shared.retrieveImage(with: self) { result in
//                switch result {
//                case let .success(image):
//                    observer.onNext(image.image)
//                case let .failure(error):
//                    observer.onError(error)
//                }
//
//                observer.onCompleted()
//            }
//
//            return Disposables.create {
//                imageTask?.cancel()
//            }
//        }
//    }
// }
