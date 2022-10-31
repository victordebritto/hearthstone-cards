//
//  InfoService.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Alamofire
import Foundation

protocol InfoServiceProtocol: GenericService {
    func resolveCategoryURL(category: CategoryTypes, parameter: String) -> String
    func getInfo(completion: @escaping completion <Info?>)
    func getCardsByCategory(category: CategoryTypes, item: String, completion: @escaping completion <[Card]?>)
}

class InfoService: InfoServiceProtocol {
    private let headers: [HTTPHeader] = [
        HTTPHeader(name: "X-RapidAPI-Key", value: "3111e87e19msh3c71ea08afc2e9dp15407ajsn6312f0f43f72"),
        HTTPHeader(name: "X-RapidAPI-Host", value: "omgvamp-hearthstone-v1.p.rapidapi.com")
    ]
    private let baseUrl = "https://omgvamp-hearthstone-v1.p.rapidapi.com"
    
    internal func resolveCategoryURL(category: CategoryTypes, parameter: String) -> String {
        let url = baseUrl + "/cards"
        
        switch category {
        case .classes:
            return url + "/classes/" + parameter
        case .sets:
            return url + "/sets/" + parameter
        case .types:
            return url + "/types/" + parameter
        case .factions:
            return url + "/factions/" + parameter
        case .qualities:
            return url + "/qualities/" + parameter
        case .races:
            return url + "/races/" + parameter
        }
    }
    
    func getInfo(completion: @escaping completion <Info?>) {
        AF.request(baseUrl + "/info",
                   method: .get,
                   headers: HTTPHeaders(headers)).validate().responseDecodable(of: Info.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getCardsByCategory(category: CategoryTypes, item: String, completion: @escaping completion <[Card]?>) {
        let url = self.resolveCategoryURL(category: category, parameter: item)
        
        AF.request(url,
                   method: .get,
                   headers: HTTPHeaders(headers)).responseDecodable(of: [Card].self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
}
