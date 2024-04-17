//
//  ContentView.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 13/10/23.
//

import SwiftUI
import Resolver

struct ListCharactersView: View {
    @State private var searchText = ""

    @StateObject var viewModel: ListCharactersViewModel = Resolver.resolve()

    var searchResults: [String] {
        switch viewModel.state {
        case .loading, .failure: return []
        case .success(let characters):
            if searchText.isEmpty {
                return characters.list.map { $0.name }
            } else {
                return characters.list.filter { $0.name.contains(searchText) }.map { $0.name }
            }
        }
    }
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .success(let characters):
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(characters.list.filter({$0.name.contains(searchText) || searchText == ""})) { character in
                        NavigationLink(value: CharacterRoute.Detail(character)) {
                            CharacterRow(
                                character: character
                            )
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .sidebar) {
                ForEach(searchResults, id: \.self) { result in
                    Text(result).searchCompletion(result)
                }
            }
            .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
            .background(Image("rm").resizable().scaledToFill())
                

        case .failure(let errorMessage):
            Text(errorMessage.message)
        }
    
    }
}

struct CharacterRow: View {
    let character: CharacterBo
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(
                    url: URL(string: character.image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 60, maxHeight: 60)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).padding(8)
                VStack(alignment: .leading) {
                    Text(character.name).font(.title).foregroundColor(.black)
                    Text("\(character.species) - \(character.status)").font(.footnote).foregroundColor(.black)
                }
                Spacer()
            }
            Divider()
        }
        
    }
}


