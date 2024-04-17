//
//  EpisodeBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

struct EpisodeBo: Identifiable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
}
