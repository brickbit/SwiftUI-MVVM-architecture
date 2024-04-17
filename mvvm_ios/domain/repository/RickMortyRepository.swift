//
//  RickMortyRepository.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

protocol RickMortyRepository {
    func getDataLink() async -> Result<DataLinkBo, ErrorType>
    func getCharacters(url: String) async -> Result<[CharacterBo], ErrorType>
    func getEpisodes(url: String) async -> Result<[EpisodeBo], ErrorType>
    func getLocations(url: String) async -> Result<[LocationBo], ErrorType>
}
