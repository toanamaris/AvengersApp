//
//  CharacterDetailsModel.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation

class CharacterDetailsModel: Codable {
    var data: CharacterDetailsRestult
}

class CharacterDetailsRestult: Codable {
    var results: [CharacterDetails]
}

class CharacterDetails: Codable {
    var id: Int32
    var name: String
    var resourceURI: String
    var thumbnail: CharacterThumbnail
    var comics: CharacterCollectionHistory
    var series: CharacterCollectionHistory
    var stories: CharacterCollectionHistory
    var events: CharacterCollectionHistory
    var urls: [CharacterURLS]
}

class CharacterCollectionHistory: Codable {
    var available: Int
    var items: [CharacterCollectionHistoryItem]
}

class CharacterCollectionHistoryItem: Codable {
    var resourceURI: String
    var name: String
}

class CharacterURLS: Codable {
    var type: String
    var url: String
}
