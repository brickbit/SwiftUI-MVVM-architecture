//
//  CourseDetailViewModel.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation
import Resolver

@MainActor class DetailCourseViewModel: ObservableObject {

    @Injected private var useCase: GetDetailCourseUseCase
    
    @Published private(set) var state: CourseDetailState = .loading
    
    func initialize(link: String) {
        loadDetail(link: link)
    }
    
    private func loadDetail(link: String) {
        Task {
            switch await useCase.invoke(link: link) {
            case .success(let courseDetail): state = .success(SuccessCourseDetailState(course: courseDetail))
            case .failure(let errorMessage): state = .failure(FailureCourseDetailState(message: errorMessage.getString()))
            }
        }
    }
}

enum CourseDetailState {
    case loading
    case success(SuccessCourseDetailState)
    case failure(FailureCourseDetailState)
}

struct SuccessCourseDetailState {
    let course: CourseDetailBo
}

struct FailureCourseDetailState {
    let message: String
}
