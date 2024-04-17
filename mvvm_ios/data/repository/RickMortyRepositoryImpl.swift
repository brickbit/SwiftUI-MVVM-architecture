//
//  RickMortyRepositoryImpl.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import Foundation

class RickMortyRepositoryImpl: RickMortyRepository {
    func getDataLink() async -> Result<DataLinkBo, ErrorType> {
        guard let url = URL(string: BASE_URL + GET_RICK_MORTY_DATA) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(DataLinkDto.self, from: data) {
                let results = decodedResponse.toBo()
                return Result.success(results)
            }
            return Result.failure(ErrorType.parseError)
        } catch {
            return Result.failure(ErrorType.unknownNetworkError)
        }
    }
    
    
    func getCharacters(url: String) async -> Result<[CharacterBo], ErrorType> {
        guard let url = URL(string: url) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(CharacterDataDto.self, from: data) {
                let results = decodedResponse.results.compactMap { $0.toBo() }
                return Result.success(results)
            }
            return Result.failure(ErrorType.parseError)
        } catch {
            return Result.failure(ErrorType.unknownNetworkError)
        }
    }
    
    func getEpisodes(url: String) async -> Result<[EpisodeBo], ErrorType> {
        guard let url = URL(string: url) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(EpisodeDataDto.self, from: data) {
                let results = decodedResponse.results.compactMap { $0.toBo() }
                return Result.success(results)
            }
            return Result.failure(ErrorType.parseError)
        } catch {
            return Result.failure(ErrorType.unknownNetworkError)
        }
    }
    
    func getLocations(url: String) async -> Result<[LocationBo], ErrorType> {
        guard let url = URL(string: url) else {
            return Result.failure(ErrorType.unknownHostException)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(LocationDataDto.self, from: data) {
                let results = decodedResponse.results.compactMap { $0.toBo() }
                return Result.success(results)
            }
            return Result.failure(ErrorType.parseError)
        } catch {
            return Result.failure(ErrorType.unknownNetworkError)
        }
    }
    
}
