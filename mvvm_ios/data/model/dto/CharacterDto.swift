//
//  CharacterDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct CharacterDto: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: CharacterLocationDto
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterDto {
    func toBo() -> CharacterBo {
        return CharacterBo(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin.url,
            location: location.url,
            image: image,
            episode: episode,
            url: url,
            created: created
        )
    }
}



