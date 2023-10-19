//
//  ListCoursesViewModel.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation
import Resolver

@MainActor
class ListCoursesViewModel: ObservableObject {
    @Injected private var useCase: GetListCourseUseCase

    @Published private(set) var state: CourseListState = .loading
    
    init() {
        loadCourses()
    }
    
    private func loadCourses() {
        Task {
            switch await useCase.invoke() {
            case .success(let courses): state = .success(SuccessCourseListState(list: courses))
            case .failure(let errorMessage): state = .failure(FailureCourseListState(message: errorMessage.getString()))
            }
        }
    }
}

enum CourseListState {
    case loading
    case success(SuccessCourseListState)
    case failure(FailureCourseListState)
}

struct SuccessCourseListState {
    let list: [CourseBo]
}

struct FailureCourseListState {
    let message: String
}
