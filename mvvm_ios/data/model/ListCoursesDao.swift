//
//  ListCoursesDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation

struct ListCoursesDao: Codable {
    let data: [CourseDao?]
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
