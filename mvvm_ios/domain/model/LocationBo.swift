//
//  LocationBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

struct LocationBo: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
