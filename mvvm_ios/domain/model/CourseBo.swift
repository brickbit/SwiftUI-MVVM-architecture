//
//  CourseBo.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation

struct CourseBo: Identifiable, Hashable, Equatable {
    let id: String
    let title: String
    let description: String
    let image: String
    let link: String
}
