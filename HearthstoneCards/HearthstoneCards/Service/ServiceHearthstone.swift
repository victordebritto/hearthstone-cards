//
//  InfoService.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Alamofire
import Foundation

protocol ServiceHearthstoreProtocol: GenericService {
    func getInfo(completion: @escaping completion <Info?>)
    func getCardsByCategory(category: CategoryTypes, item: String, completion: @escaping completion <[Card]?>)
}

class ServiceHearthstone: ServiceHearthstoreProtocol {
    private let headers: [HTTPHeader] = [
        HTTPHeader(name: "X-RapidAPI-Key", value: "3111e87e19msh3c71ea08afc2e9dp15407ajsn6312f0f43f72"),
        HTTPHeader(name: "X-RapidAPI-Host", value: "omgvamp-hearthstone-v1.p.rapidapi.com")
    ]
    private let baseUrl = "https://omgvamp-hearthstone-v1.p.rapidapi.com"
    
    private func resolveCategoryURL(category: CategoryTypes, parameter: String) -> String {
        let url = baseUrl + "/cards"
        
        guard let encodedParameter = parameter.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        
        switch category {
        case .classes:
            return url + "/classes/" + encodedParameter
        case .sets:
            return url + "/sets/" + encodedParameter
        case .types:
            return url + "/types/" + encodedParameter
        case .factions:
            return url + "/factions/" + encodedParameter
        case .qualities:
            return url + "/qualities/" + encodedParameter
        case .races:
            return url + "/races/" + encodedParameter
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
