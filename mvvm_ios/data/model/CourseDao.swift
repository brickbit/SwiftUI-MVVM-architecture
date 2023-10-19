//
//  CourseDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation

struct CourseDao: Codable {
    let courseId: String
    let attributes: CourseAttributesDao
    let link: LinkDao
    
    private enum CodingKeys: String, CodingKey {
        case courseId = "id"
        case attributes = "attributes"
        case link = "links"
    }

}

extension CourseDao {
    func toBo() -> CourseBo {
        return CourseBo(
            id: courseId,
            title: attributes.name ?? "",
            description: attributes.formattedDescription ?? "",
            image: attributes.artworkUrl ?? "",
            link: link.link
        )
    }
}

