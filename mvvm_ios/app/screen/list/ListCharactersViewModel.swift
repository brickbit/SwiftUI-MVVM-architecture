//
//  ListCoursesViewModel.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation
import Resolver

@MainActor
class ListCharactersViewModel: ObservableObject {
    @Injected private var useCase: GetCharactersUseCase

    @Published private(set) var state: CharacterListState = .loading
    
    init() {
        loadCharacters()
    }
    
    private func loadCharacters() {
        Task {
            switch await useCase.invoke() {
            case .success(let character): state = .success(SuccessCharacterListState(list: character))
            case .failure(let errorMessage): state = .failure(FailureCharacterListState(message: errorMessage.getString()))
            }
        }
    }
}

enum CharacterListState {
    case loading
    case success(SuccessCharacterListState)
    case failure(FailureCharacterListState)
}

struct SuccessCharacterListState {
    let list: [CharacterBo]
}

struct FailureCharacterListState {
    let message: String
}
