//
//  CryptoHelper.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import CryptoSwift

class CryptoHelper {
    static let shared = CryptoHelper()
    
    func toMD5(input: String) -> String {
        let hash = input.md5()
        return hash
    }
}
