//
//  GetCharactersUseCaseTests.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI
import XCTest

class GetCharactersUseCaseTests: XCTestCase {

    private var repository: CharactersRepositoryMock!
    private var useCase: GetCharactersUseCase!

    override func setUp() {
        repository = CharactersRepositoryMock()
        useCase = .init(repository: repository)
    }

    func testGetCharacters() async {
        // Given
        let expectedValue = [Character.mock()]
        repository.executeInputResult = expectedValue
        // When
        let response = await useCase.invoke(request: .init(character: .empty))
        // Then
        XCTAssertEqual(response, .success(expectedValue))
    }

    func testGetCharactersError() async {
        // Given
        repository.executeInputResult = nil
        // When
        let response = await useCase.invoke(request: .init(character: .empty))
        // Then
        XCTAssertEqual(response, .failure(UseCaseError.decodingError))
    }
}
