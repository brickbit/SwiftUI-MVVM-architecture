//
//  CharacterLocationDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import Foundation
import SwiftData

@Model
class CharacterLocationDao {
    var name: String
    var url: String
    
    init(name: String = "", url: String = "") {
        self.name = name
        self.url = url
    }
}
