//
//  CharacterBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

struct CharacterBo: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
