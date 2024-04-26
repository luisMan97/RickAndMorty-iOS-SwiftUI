//
//  CharactersViewModelTests.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI
import XCTest
import Combine

class CharactersViewModelTests: XCTestCase {

    private var viewModel: CharactersViewModel!
    private var getCharactersUseCase: GetCharactersUseCaseMock!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        getCharactersUseCase = GetCharactersUseCaseMock()
        viewModel = CharactersViewModel(getCharactersUseCase: getCharactersUseCase)
    }

    func testGetEpisodes() async {
        let expectedValue = [Character.mock()]
        getCharactersUseCase.executeResult = .success(expectedValue)
        await viewModel.getCharacters()
        XCTAssertEqual(viewModel.characters, expectedValue)
    }

    func testGetEpisodesError() async {
        getCharactersUseCase.executeResult = .failure(UseCaseError.decodingError)
        await viewModel.getCharacters()
        XCTAssertEqual(viewModel.error, UseCaseError.decodingError.localizedDescription)
    }
    
    func testGetRelatedCharacters() {
        // Arrange
        let character1 = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "rick.jpg")
        let character2 = Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", image: "morty.jpg")
        let character3 = Character(id: 3, name: "Summer Smith", status: "Alive", species: "Human", gender: "Female", image: "summer.jpg")
        let character4 = Character(id: 4, name: "Jerry Smith", status: "Alive", species: "Human", gender: "Male", image: "jerry.jpg")
        let characters = [character1, character2, character3, character4]
        viewModel.characters = characters
        // Act
        let relatedCharacters = viewModel.getRelatedCharacters(character: character2)
        // Assert
        XCTAssertEqual(relatedCharacters.count, 3)
        XCTAssertFalse(relatedCharacters.contains(character2))
    }
    
    func testSearchWithNoText() async {
        // Arrange
        viewModel.searchText = ""
        // Act
        await viewModel.search()
        // Assert
        XCTAssertEqual(viewModel.characters.count, 0)
        XCTAssertEqual(viewModel.state, .intial)
    }
    
    func testSearchWithText() async {
        // Arrange
        let expectedValue: [Character] = [
            Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "rick.jpg"),
            Character(id: 2, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "morty.jpg")
        ]
        getCharactersUseCase.executeResult = .success(expectedValue)
        viewModel.searchText = "Rick"
        // Act
        await viewModel.search()
        let debouncer = Debouncer(duration: .seconds(0.5))
        guard await debouncer.sleep() else { return }
        // Assert
        XCTAssertEqual(viewModel.characters.count, 2)
        XCTAssertEqual(viewModel.state, .loaded)
    }
}
