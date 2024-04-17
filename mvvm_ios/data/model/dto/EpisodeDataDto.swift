//
//  EpisodeDataDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct EpisodeDataDto: Codable {
    let info: InfoDto
    let results: [EpisodeDto]
}
