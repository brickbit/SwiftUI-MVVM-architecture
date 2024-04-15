//
//  DetailCourseView.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 17/10/23.
//

import SwiftUI
import Resolver

struct DetailCourseView: View {
    @State var link: String
    
    @StateObject var viewModel: DetailCourseViewModel = Resolver.resolve()
    
    init(link: String) {
        self.link = link
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let course):
                CourseDetail(course: course.course)
                    .navigationTitle(course.course.title)
            case .failure(let errorMessage):
                Text(errorMessage.message)
            }
        }.onAppear() {
            viewModel.initialize(link: self.link)
        }
    }
}

struct CourseDetail: View {
    let course: CourseDetailBo
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: course.image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack {
                    Text(course.title)
                    Text(course.description)
                    
                    ForEach(course.content) { episode in
                        CourseEpisode(episode: episode)
                    }
                }.padding(16)
            }
        }
    }
}

struct CourseEpisode: View {
    let episode: CourseEpisodeBo
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.description)
            Divider()
        }
    }
}


