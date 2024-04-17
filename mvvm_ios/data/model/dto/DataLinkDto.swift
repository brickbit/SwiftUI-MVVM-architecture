//
//  DataLinkDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

import Foundation

struct DataLinkDto: Codable {
    let characters: String
    let episodes: String
    let locations: String
    
    private enum CodingKeys: String, CodingKey {
        case characters = "characters"
        case episodes = "episodes"
        case locations = "locations"
    }
}

extension DataLinkDto {
    func toBo() -> DataLinkBo {
        return DataLinkBo(
            characters: characters,
            episodes: episodes,
            locations: locations
        )
    }
}
