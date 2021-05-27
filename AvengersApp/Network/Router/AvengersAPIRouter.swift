//
//  AvengersAPIRouter.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import Alamofire

enum AvengersAPIRouter: APIRouterProtocol {
    
    var headers: [String : String]? {
        return [:]
    }
    
    case getCharacterList(apiKey: String, ts: String, hash: String)
    case getCharacterDetails(apiKey: String, ts: String, hash: String, id: String)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getCharacterList:
            return "public/characters"
        case .getCharacterDetails(_,_,_, let id):
            return "public/characters/\(id)"
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .getCharacterList(let apiKey, let ts, let hash), .getCharacterDetails(let apiKey, let ts, let hash, _):
            let parameters = ["apikey" : apiKey, "ts" : ts, "hash" : hash]
            return parameters
        }
    }
}
