//
//  FavoriteCharacters.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 25/04/24.
//

import SwiftUI
import SwiftData

struct FavoriteCharacters: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var characters: [Character]
    @State var viewModel: FavoriteCharactersViewModel

    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                searchView
                switch viewModel.state {
                case .loaded: listView
                case .empty: emptyView
                case .error: errorView
                }
            }
            .background(.primaryGreen)
        }
        .onAppear { viewModel.getFilteredCharacters(characters: characters) }
        .onChange(of: viewModel.searchText) { viewModel.getFilteredCharacters(characters: characters) }
        .onChange(of: characters) { viewModel.getFilteredCharacters(characters: characters) }
    }

    @ViewBuilder
    var searchView: some View {
        if viewModel.state != .empty {
            SearchField(configuration: .init(
                text: $viewModel.searchText,
                placeholderText: "Busca tu personaje favorito"
            ))
            .padding()
        }
    }

    var listView: some View {
        List {
            ForEach(viewModel.filteredCharacters) { character in
                CharacterRowView(viewModel:
                        .init(character: character,
                              configuration: .init(),
                              modelContext: modelContext)
                )
            }
        }
    }
}

private extension FavoriteCharacters {
    var backgroundColor: some View {
        Color.primaryGreen
            .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Private views
private extension FavoriteCharacters {

    var emptyView: some View {
        AlertView(configuration: .init(imageName: .magnifyingglass,
                                       imageColor: .primaryGreen,
                                       text: .emptyState))
        .padding(.top)
        .background(Color.primaryGray)
    }
    
    var errorView: some View {
        AlertView(configuration: .init(imageName: .magnifyingglass,
                                       text: .emptyFilteredState))
        .padding(.top)
        .background(Color.primaryGray)
    }
}

// MARK: - String constants
private extension String {
    static let emptyState: String = String(localized: "empty.state")
    static let emptyFilteredState: String = String(localized: "favorite.empty.state")
    static let magnifyingglass = "mail.and.text.magnifyingglass"
    static let xCircle = "x.circle"
}

//#Preview {
//    FavoriteCharacters(viewModel: CharactersViewModel)
//}

