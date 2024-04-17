//
//  InfoDao.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 16/4/24.
//

import SwiftData

@Model
class InfoDao {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
    
    init(count: Int = 0, pages: Int = 0, next: String? = nil, prev: String? = nil) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
