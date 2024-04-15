//
//  CoursesAttributesDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation

struct CourseAttributesDao: Codable {
    let name: String?
    let description: String?
    let formattedDescription: String?
    let artworkUrl:String?
    let difficulty: String?
    let contributor:String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case formattedDescription = "description_plain_text"
        case artworkUrl = "card_artwork_url"
        case difficulty = "difficulty"
        case contributor = "contributor_string"
    }
}
