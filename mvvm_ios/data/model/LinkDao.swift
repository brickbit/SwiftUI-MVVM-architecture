//
//  LinkDao.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 15/10/23.
//

import Foundation

struct LinkDao: Codable {
    let link: String
    
    private enum CodingKeys: String, CodingKey {
        case link = "self"
    }
}
