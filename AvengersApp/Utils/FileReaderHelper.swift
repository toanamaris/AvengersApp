//
//  FileReaderHelper.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 26/05/2021.
//

import Foundation


class FileReaderHelper {
    static let shared = FileReaderHelper()
    
    func getStringFromFile(fileName: String, type: String) -> String? {
        if let filepath = Bundle.main.path(forResource: fileName, ofType: type) {
            do {
                let contents = try String(contentsOfFile: filepath)
                return contents
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
