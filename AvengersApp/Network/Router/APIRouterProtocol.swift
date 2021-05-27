//
//  APIRouterProtocol.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import Alamofire

protocol APIRouterProtocol: APIRouterAbstract {}

extension APIRouterProtocol {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var apiVersion: String {
        return Environment.apiVersion
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path = "/\(apiVersion)/\(path)"
        
        if queryString != nil {
            urlComponents?.query = queryString
        }
        
        let url = urlComponents?.url
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = method.rawValue
        
        for (headerField, value) in headers ?? [:] {
            urlRequest.setValue(value, forHTTPHeaderField: headerField)
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
}
