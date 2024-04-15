//
//  GetListCourseUseCase.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation
import Resolver

class GetListCourseUseCase {
    
    @Injected private var repository: CourseRepository

    func invoke() async -> Result<[CourseBo], ErrorType> {
        return await repository.getCourseList()
    }
}
