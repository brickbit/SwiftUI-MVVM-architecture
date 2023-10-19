//
//  CourseDetailDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation

struct CourseDetailDao: Codable{
    let data: CourseDetailDataDao
    let content: [CourseItemDao]
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case content = "included"
    }
}

struct CourseDetailDataDao: Codable{
    let attributes: CourseAttributesDao
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
    }
}

extension CourseDetailDao {
    func toBo() -> CourseDetailBo {
        return CourseDetailBo(
            title: data.attributes.name ?? "",
            description: data.attributes.formattedDescription ?? data.attributes.description ?? "",
            image: data.attributes.artworkUrl ?? "",
            content: content.map { $0.toBo() }
        )
    }
}

