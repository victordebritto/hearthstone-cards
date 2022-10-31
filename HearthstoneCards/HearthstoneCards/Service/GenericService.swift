//
//  GenericService.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case errorRequest(AFError)
    case invalidEndpoint
    case genericError
}
