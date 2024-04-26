//
//  GetEpisodesUseCaseMock.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI

class GetCharactersUseCaseMock: GetCharactersUseCaseProtocol {

    var executeResult: Result<[Character], UseCaseError> = .success([Character.mock()])

    func invoke(request: CharactersRequest) async -> Result<[Character], UseCaseError> {
        executeResult
    }
}
