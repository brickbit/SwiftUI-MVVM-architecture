//
//  LocationDataDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 17/4/24.
//

import SwiftData

@Model
class LocationDataDao {
    var info: InfoDao
    var results: [LocationDao]
    
    init(info: InfoDao, results: [LocationDao] = []) {
        self.info = info
        self.results = results
    }
}
