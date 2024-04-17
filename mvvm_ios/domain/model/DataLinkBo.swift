//
//  DataLinkBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

import Foundation

struct DataLinkBo {
    let characters: String
    let episodes: String
    let locations: String
    
    private enum CodingKeys: String, CodingKey {
        case characters = "characters"
        case episodes = "episodes"
        case locations = "locations"
    }
}
