//
//  CharacterDetailBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

struct CharacterDetailBo {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: LocationBo?
    let image: String
    let episode: [EpisodeBo]
    let url: String
    let created: String
}

extension CharacterBo {
    func toDetail(origin: LocationBo?, location: LocationBo?, episode: [EpisodeBo]) -> CharacterDetailBo {
        return CharacterDetailBo(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            episode: episode,
            url: url,
            created: created
        )
    }
}
    
