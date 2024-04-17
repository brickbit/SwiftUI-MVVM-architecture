//
//  CourseDetailViewModel.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation
import Resolver

@MainActor class DetailCharacterViewModel: ObservableObject {

    @Injected private var episodeUseCase: GetEpisodesUseCase
    @Injected private var locationUseCase: GetLocationsUseCase

    @Published private(set) var state: CharacterDetailState = .loading
    
    func initialize(character: CharacterBo) {
        loadDetail(character: character)
    }
    
    private func loadDetail(character: CharacterBo) {
        Task {
            let episodeList = await episodeUseCase.invoke()
            let locationList = await locationUseCase.invoke()
            
            let episodes = try? episodeList.get()
            let locations = try? locationList.get()
            
            let origin = locations?.first(where: {$0.url == character.origin})
            let location = locations?.first(where: {$0.url == character.location})
            let episodesForCharacter = episodes?.filter({
                character.episode.contains($0.url)
            })
            
            state = CharacterDetailState.success(SuccessCharacterDetailState(character: character.toDetail(origin: origin, location: location, episode: episodesForCharacter ?? [])))
            
        }
    }
}

enum CharacterDetailState {
    case loading
    case success(SuccessCharacterDetailState)
    case failure(FailureCharacterDetailState)
}

struct SuccessCharacterDetailState {
    let character: CharacterDetailBo
}

struct FailureCharacterDetailState {
    let message: String
}
