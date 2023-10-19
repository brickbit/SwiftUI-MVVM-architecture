//
//  GetDetailCourseUseCase.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation
import Resolver

class GetDetailCourseUseCase {
    @Injected private var repository: CourseRepository

    func invoke(link:String) async -> Result<CourseDetailBo, ErrorType> {
        return await repository.getCourseDetail(link: link)
    }
}
