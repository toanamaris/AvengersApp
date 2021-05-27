//
//  CharacterListModel.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation


class CharacterListModel: Codable {
    var data: CharacterListRestul
}

class CharacterListRestul: Codable {
    var results: [CharacterListDetails]
}

class CharacterListDetails: Codable {
    var id: Int32
    var name: String
    var resourceURI: String
    var thumbnail: CharacterThumbnail
}

class CharacterThumbnail: Codable {
    var path: String
    var `extension` : String
}
