//
//  Navigator.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 17/10/23.
//

import SwiftUI

struct Navigator: View {
    
    var body: some View {
        NavigationStack {
            ListCharactersView()
            .navigationTitle("Rick & Morty")
            .navigationDestination(for: CharacterRoute.self) { route in
                switch(route) {
                case .Detail(let character):
                    DetailCharacterView(character: character)
                }
            }
        }
    }
}
