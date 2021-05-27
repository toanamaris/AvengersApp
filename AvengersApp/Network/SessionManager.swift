//
//  SessionManager.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import Alamofire

class SessionManager {
    static let share = SessionManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = AppConfig.shared.networkTimeout
        configuration.timeoutIntervalForResource = AppConfig.shared.networkTimeout
        let session = Session(configuration: configuration)
        return session
    }()
}
