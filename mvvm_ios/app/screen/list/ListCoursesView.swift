//
//  ContentView.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 13/10/23.
//

import SwiftUI
import Resolver

struct ListCoursesView: View {
    
    @StateObject var viewModel: ListCoursesViewModel = Resolver.resolve()

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .success(let courses):
            List {
                ForEach(courses.list) { course in
                    NavigationLink(value: CourseRoute.Detail(course.link)) {
                        CourseRow(
                            course: course
                        )
                    }
                }
            }
        case .failure(let errorMessage):
            Text(errorMessage.message)
        }
    
    }
}

struct CourseRow: View {
    let course: CourseBo
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: course.image),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 60, maxHeight: 60)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(course.title)
        }
        
    }
}


