//
//  CourseRepository.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation

protocol CourseRepository {
    func getCourseList() async -> Result<[CourseBo], ErrorType>
    func getCourseDetail(link: String) async -> Result<CourseDetailBo, ErrorType>
}
