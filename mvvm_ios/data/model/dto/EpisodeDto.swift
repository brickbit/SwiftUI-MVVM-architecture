//
//  EpisodeDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct EpisodeDto: Codable {
    let id: Int
    let name: String
    let airDate: String?
    let episode: String?
    let characters: [String]
    let url: String
    let created: String
}

extension EpisodeDto {
    func toBo() -> EpisodeBo {
        return EpisodeBo(
            id: id,
            name: name,
            airDate: airDate ?? "",
            episode: episode ?? "",
            characters: characters,
            url: url,
            created: created
        )
    }
}
