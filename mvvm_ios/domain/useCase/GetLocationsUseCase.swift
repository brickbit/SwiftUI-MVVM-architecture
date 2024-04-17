//
//  GetLocationBo.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import Resolver

class GetLocationsUseCase {
    
    @Injected private var repository: RickMortyRepository

    func invoke() async -> Result<[LocationBo], ErrorType> {
        let data = await repository.getDataLink()
        do {
            let url = try data.get().locations
            return await repository.getLocations(url: url)
        } catch {
            return Result.failure(ErrorType.locationError)
        }
    }
}
