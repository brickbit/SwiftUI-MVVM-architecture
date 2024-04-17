//
//  CharacterDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import SwiftData

@Model
class CharacterDao {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: CharacterLocationDao
    var location: CharacterLocationDao
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
    init(id: Int, name: String = "", status: String = "", species: String = "", type: String = "", gender: String = "", origin: CharacterLocationDao, location: CharacterLocationDao, image: String = "", episode: [String] = [], url: String = "", created: String = "") {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
