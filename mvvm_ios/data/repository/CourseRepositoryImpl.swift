//
//  CourseRepositoryImpl.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation

class CourseRepositoryImpl: CourseRepository {
    
    func getCourseList() async -> Result<[CourseBo], ErrorType> {
        guard let url = URL(string: BASE_URL + GET_COURSES) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(ListCoursesDao.self, from: data) {
                let results = decodedResponse.data.compactMap {$0?.toBo()}
                return Result.success(results)
            }
        } catch {
            return Result.failure(ErrorType.unknownHostException)
        }
        return Result.failure(ErrorType.unknownError(UnknownError(error: "Se ha producido un error desconocido")))
    }
    
    func getCourseDetail(link: String) async -> Result<CourseDetailBo, ErrorType> {
        guard let url = URL(string: link) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(CourseDetailDao.self, from: data) {
                return Result.success(decodedResponse.toBo())
            }
        } catch {
            return Result.failure(ErrorType.unknownHostException)
        }
        return Result.failure(ErrorType.unknownError(UnknownError(error: "Se ha producido un error desconocido")))
    }
}
