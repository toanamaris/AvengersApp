//
//  APIRouterAbstract.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import Alamofire

protocol APIRouterAbstract: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: [String: String]? { get }
    var queryString: String? { get }
}

extension APIRouterAbstract {
    var parameters: Parameters? {return nil}
    var header: [String: String]? {return nil}
    var queryString: String? {return nil}
}
