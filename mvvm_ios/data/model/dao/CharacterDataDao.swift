//
//  CharacterDataDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import SwiftData

@Model
class CharacterDataDao {
    var info: InfoDao
    var results: [CharacterDao]
    
    init(info: InfoDao, results: [CharacterDao] = []) {
        self.info = info
        self.results = results
    }
}
