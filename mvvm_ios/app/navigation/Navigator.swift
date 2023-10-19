//
//  Navigator.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 17/10/23.
//

import SwiftUI

struct Navigator: View {
    
    var body: some View {
        NavigationStack {
            ListCoursesView()
            .navigationTitle("RayWenderlich courses")
            .navigationDestination(for: CourseRoute.self) { route in
                switch(route) {
                case .Detail(let link):
                    DetailCourseView(link: link)
                }
            }
        }
    }
}
