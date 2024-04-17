//
//  injection.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 16/10/23.
//

import Foundation
import Resolver

import Resolver

extension Resolver: ResolverRegistering {
    @MainActor
    public static func registerAllServices() {
        defaultScope = .application
        

        //Use cases
        register {GetCharactersUseCase()}
        register {GetEpisodesUseCase()}
        register {GetLocationsUseCase()}
        
        //Repositories        
        register {RickMortyRepositoryImpl()}.implements(RickMortyRepository.self)

        //ViewModels
        register {ListCharactersViewModel()}
        register {DetailCharacterViewModel()}

    }
}
