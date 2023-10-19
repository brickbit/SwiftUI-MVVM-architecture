//
//  CourseItemDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation

struct CourseItemDao: Codable {
    let id: String
    let type: String
    let data: CourseAttributesDao
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case data = "attributes"
    }
}


extension CourseItemDao {
    func toBo() -> CourseEpisodeBo {
        return CourseEpisodeBo(
            id: Int.random(in: 1..<1000),
            title: data.name ?? "",
            description: data.formattedDescription ?? data.description ?? ""
        )
    }
}
