//
//  DetailCourseView.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 17/10/23.
//

import SwiftUI
import Resolver

struct DetailCharacterView: View {
    @State var character: CharacterBo
    
    @StateObject var viewModel: DetailCharacterViewModel = Resolver.resolve()
    
    init(character: CharacterBo) {
        self.character = character
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let character):
                CharacterDetail(character: character.character)
                    .navigationTitle(character.character.name)
            case .failure(let errorMessage):
                Text(errorMessage.message)
            }
        }.onAppear() {
            viewModel.initialize(character: self.character)
        }
    }
}

struct CharacterDetail: View {
    let character: CharacterDetailBo
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: character.image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack(alignment: .leading) {
                    Text(character.species)
                    if let origin = character.origin?.name {
                        HStack {
                            Text("Origen: ")
                            Text(origin)
                        }
                    }
                    if let location = character.location?.name {
                        HStack {
                            Text("Ubicación: ")
                            Text(location)
                        }
                    }
                    Text("Episodios").font(.title2).padding(.vertical)
                    ForEach(character.episode) { episode in
                        EpisodeItem(episode: episode)
                    }
                }.padding(16)
            }
        }
    }
}

struct EpisodeItem: View {
    let episode: EpisodeBo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(episode.episode)
                Text(episode.name)
            }
            Divider()
        }
    }
}


