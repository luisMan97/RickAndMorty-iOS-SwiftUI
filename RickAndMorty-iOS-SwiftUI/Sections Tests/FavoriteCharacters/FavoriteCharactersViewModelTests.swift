//
//  FavoriteCharactersViewModelTests.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 26/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI
import XCTest

class FavoriteCharactersViewModelTests: XCTestCase {
    
    var viewModel: FavoriteCharactersViewModel!
    
    override func setUpWithError() throws {
        viewModel = FavoriteCharactersViewModel()
    }

    func testGetFilteredCharactersWithEmptyText() {
        // Arrange
        let characters = [
            Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "rick.jpg"),
            Character(id: 2, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "morty.jpg")
        ]
        
        // Act
        viewModel.searchText = ""
        viewModel.getFilteredCharacters(characters: characters)
        
        // Assert
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssertEqual(viewModel.filteredCharacters.count, 2)
        XCTAssertEqual(viewModel.filteredCharacters, characters)
    }
    
    func testGetFilteredCharactersWithMatchingText() {
        // Arrange
        let characters = [
            Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "rick.jpg"),
            Character(id: 2, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "morty.jpg")
        ]
        
        // Act
        viewModel.searchText = "Rick"
        viewModel.getFilteredCharacters(characters: characters)
        
        // Assert
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssertEqual(viewModel.filteredCharacters.count, 1)
        XCTAssertEqual(viewModel.filteredCharacters.first?.name, "Rick")
    }
    
    func testGetFilteredCharactersWithNonMatchingText() {
        // Arrange
        let characters = [
            Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "rick.jpg"),
            Character(id: 2, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "morty.jpg")
        ]
        
        // Act
        viewModel.searchText = "Jerry"
        viewModel.getFilteredCharacters(characters: characters)
        
        // Assert
        XCTAssertEqual(viewModel.state, .error)
        XCTAssertEqual(viewModel.filteredCharacters.count, 0)
    }
}
