//
//  mvvm_iosApp.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 13/10/23.
//

import SwiftUI
import SwiftData

@main
struct mvvm_iosApp: App {
    var body: some Scene {
        WindowGroup {
            Navigator()
        }
        .modelContainer(for: [DataLinkDao.self, InfoDao.self, CharacterLocationDao.self,CharacterDao.self, CharacterDataDao.self, EpisodeDao.self, EpisodeDataDao.self, LocationDao.self,LocationDataDao.self])
    }
}
