//
//  InfoDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct InfoDto: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
