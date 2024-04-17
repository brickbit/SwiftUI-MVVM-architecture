//
//  EpisodeDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 17/4/24.
//

import SwiftData

@Model
class EpisodeDao {
    var id: Int
    var name: String
    var airDate: String?
    var episode: String?
    var characters: [String]
    var url: String
    var created: String
    
    init(id: Int, name: String = "", airDate: String? = nil, episode: String? = nil, characters: [String] = [], url: String = "", created: String = "") {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
}
