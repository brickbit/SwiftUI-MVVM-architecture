//
//  CharacterDataDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct CharacterDataDto: Codable {
    let info: InfoDto
    let results: [CharacterDto]
}
