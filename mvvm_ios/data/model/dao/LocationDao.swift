//
//  LocationDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 17/4/24.
//

import SwiftData

@Model
class LocationDao {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
    
    init(id: Int, name: String = "", type: String = "", dimension: String = "", residents: [String] = [], url: String = "", created: String = "") {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}
