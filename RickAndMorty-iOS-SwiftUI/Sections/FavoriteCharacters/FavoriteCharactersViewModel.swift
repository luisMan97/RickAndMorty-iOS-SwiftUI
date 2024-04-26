//
//  FavoriteCharactersViewModel.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 25/04/24.
//

import Foundation

enum FavoriteCharactersViewState {
    case loaded, empty, error
}

@Observable class FavoriteCharactersViewModel {
    var searchText = ""
    var state: FavoriteCharactersViewState = .loaded
    var filteredCharacters: [Character] = []

    func getFilteredCharacters(characters: [Character]) {
        state = characters.isEmpty ? .empty : .loaded
        if searchText.isEmpty {
            filteredCharacters = characters
        } else {
            let filteredCharacters = characters.filter { $0.name.contains(searchText) }
            state = filteredCharacters.isEmpty ? .error : .loaded
            self.filteredCharacters = filteredCharacters
        }
    }
}
