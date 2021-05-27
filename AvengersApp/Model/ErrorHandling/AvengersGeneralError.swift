//
//  AvengersGeneralError.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 26/05/2021.
//

import Foundation
import Alamofire

struct AvengersGeneralError: Error, Codable {
    var code: Int?
    var status: String
    
    static func generateGeneralError() -> AvengersGeneralError {
        return AvengersGeneralError(code: 500, status: "Something went wrong. Please contact admin for help")
    }
}

class AvengersErrorHandler {
    static let shared = AvengersErrorHandler()
    
    func handlerError<T: Codable>(reponse:  DataResponse<T, AFError>) -> AvengersGeneralError{
        switch reponse.response?.statusCode {
        case 401:
            return AvengersGeneralError(code: 401, status: "Credentials are incorrect. Please contact admin for help")
        case 409:
            guard let data = reponse.data, let error = try? JSONDecoder().decode(AvengersGeneralError.self, from: data) else {
                return AvengersGeneralError.generateGeneralError()
            }
            return error
            
        default:
            return AvengersGeneralError.generateGeneralError()
        }
        
    }
}


