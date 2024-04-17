//
//  EpisodeDataDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 17/4/24.
//

import SwiftData

@Model
class EpisodeDataDao {
    var info: InfoDao
    var results: [EpisodeDao]
    
    init(info: InfoDao, results: [EpisodeDao] = []) {
        self.info = info
        self.results = results
    }
}
