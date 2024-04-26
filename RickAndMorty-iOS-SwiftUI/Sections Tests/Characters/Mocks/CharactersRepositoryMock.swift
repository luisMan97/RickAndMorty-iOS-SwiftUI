//
//  EpisodesRepositoryMock.swift.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI

class CharactersRepositoryMock: CharactersRepositoryProtocol {

    var executeInputResult: [Character]!

    private var executeOutputResult: [Character] {
        get throws { return try CharactersResult() }
    }

    func getCharacters(request: CharactersRequest) async throws -> [Character] {
        try executeOutputResult
    }

    private func CharactersResult() throws -> [Character] {
        if let executeInputResult {
            return executeInputResult

        }
        throw ServiceError.decodingError
    }
}
