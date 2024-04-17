//
//  DataLinkDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 17/4/24.
//

import SwiftData

@Model
class DataLinkDao {
    var characters: String
    var episodes: String
    var locations: String
    
    init(characters: String = "", episodes: String = "", locations: String = "") {
        self.characters = characters
        self.episodes = episodes
        self.locations = locations
    }
}
