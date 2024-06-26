//
//  CharactersViewModel.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Combine
import Observation

enum CharactersViewState {
    case intial, loading, loaded, error, errorConection
}

@Observable class CharactersViewModel {

    // MARK: - Internal Observable Properties
    var state: CharactersViewState = .intial
    var characters: [Character] = []
    var error = String()
    var searchText = String()
    var listType: ListType = .grid

    // MARK: - Private Properties
    private var subscriptions: Set<AnyCancellable> = []

    // Interactor
    private var getCharactersUseCase: GetCharactersUseCaseProtocol

    // MARK: - Initializers

    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }

    // MARK: - Internal Methods
    
    @MainActor
    func getCharacters() async {
        await getCharacters(character: .empty)
    }

    func search() async {
        if searchText.count < 1 {
            self.characters = []
            self.state = .intial
            return
        }
        let debouncer = Debouncer(duration: .seconds(0.5))
        guard await debouncer.sleep() else { return }
        Task { await getCharacters(character: searchText) }
    }

    func getRelatedCharacters(character: Character) -> [Character] {
        characters.filter { $0.id != character.id }
    }

    // MARK: - Private Methods

    @MainActor
    private func getCharacters(character: String) async {
        state = .loading
        let result = await getCharactersUseCase.invoke(request: .init(character: character))
        switch result {
        case .success(let characters):
            self.characters = characters
            self.state = .loaded
        case .failure(let error):
            if error == .networkError {
                self.state = .errorConection
                return
            }
            self.state = .error
            self.error = error.localizedDescription
        }
    }
}

extension CharactersViewModel {

    enum ListType {
        case grid, vertical, gridThreeColumns

        var alternatedImageName: String {
            switch self {
            case .grid: return "rectangle.grid.1x2"
            case .vertical: return "square.grid.3x2"
            case .gridThreeColumns: return "square.grid.2x2"
            }
        }

        mutating func alternateListType() {
            switch self {
            case .grid: self = .vertical
            case .vertical: self = .gridThreeColumns
            case .gridThreeColumns: self = .grid
            }
        }
    }
}
