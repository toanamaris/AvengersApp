//
//  AppConfig.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation


class AppConfig {
    static let shared = AppConfig()
    
    let networkTimeout: TimeInterval = 60
    
    var apiKey: String {
        let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
        return key
    }
    
    var apiKeyPrivate: String {
        let keyPrivate = Bundle.main.object(forInfoDictionaryKey: "API_KEY_PRIVATE") as! String
        return keyPrivate
    }
}

