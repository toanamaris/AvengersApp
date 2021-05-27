//
//  AvengersAPIRequest.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import Alamofire

class AvengersAPIRequest {
    let session = SessionManager.share.sessionManager
    
    func getCharacterList(completiongHandler: @escaping (DataResponse<CharacterListModel?, AFError>) -> Void ){
        let authorization = authorizationGenerate()
        session.request(AvengersAPIRouter.getCharacterList(apiKey: authorization.apiKey, ts: authorization.ts, hash: authorization.hash))
            .validate()
            .responseDecodable(completionHandler: completiongHandler)
    }
    
    func getCharacterDetail(id: String , completiongHandler: @escaping (DataResponse<CharacterDetailsModel?, AFError>) -> Void ){
        let authorization = authorizationGenerate()
        session.request(AvengersAPIRouter.getCharacterDetails(apiKey: authorization.apiKey, ts: authorization.ts, hash: authorization.hash, id: id))
            .validate()
            .responseDecodable(completionHandler: completiongHandler)
    }
    
    private func authorizationGenerate() -> (ts: String, hash: String, apiKey: String) {
        let uuid = String.UUIDGenarator()
        let hashString = "\(uuid)\(AppConfig.shared.apiKeyPrivate)\(AppConfig.shared.apiKey)"
        let hash = CryptoHelper.shared.toMD5(input: hashString)
        let apiKey = AppConfig.shared.apiKey
        return (uuid, hash, apiKey)
    }
}
