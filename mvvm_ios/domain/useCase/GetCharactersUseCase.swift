//
//  GetCharactersUseCase.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import Resolver

class GetCharactersUseCase {
    
    @Injected private var repository: RickMortyRepository

    func invoke() async -> Result<[CharacterBo], ErrorType> {
        let data = await repository.getDataLink()
        do {
            let url = try data.get().characters
            return await repository.getCharacters(url: url)
        } catch {
            return Result.failure(ErrorType.characterError)
        }
    }
}
