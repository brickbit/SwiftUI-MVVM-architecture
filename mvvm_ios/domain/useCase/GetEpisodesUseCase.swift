//
//  GetEpisodesUseCase.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

import Resolver

class GetEpisodesUseCase {
    
    @Injected private var repository: RickMortyRepository

    func invoke() async -> Result<[EpisodeBo], ErrorType> {
        let data = await repository.getDataLink()
        do {
            let url = try data.get().episodes
            return await repository.getEpisodes(url: url)
        } catch {
            return Result.failure(ErrorType.episodeError)
        }
    }
}
