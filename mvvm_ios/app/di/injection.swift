//
//  injection.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 16/10/23.
//

import Foundation
import Resolver

import Resolver

extension Resolver: ResolverRegistering {
    @MainActor
    public static func registerAllServices() {
        defaultScope = .application
        

        //Use cases
        register {GetListCourseUseCase()}
        register {GetDetailCourseUseCase()}
        
        //Repositories
        register {CourseRepositoryImpl()}.implements(CourseRepository.self)
        
        //ViewModels
        register {ListCoursesViewModel()}
        register {DetailCourseViewModel()}

    }
}
