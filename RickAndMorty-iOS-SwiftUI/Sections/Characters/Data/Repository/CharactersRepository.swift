//
//  CharactersRepository.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol CharactersRepositoryProtocol {
    func getCharacters(request: CharactersRequest) async throws -> [Character]
}

struct CharactersRepository: CharactersRepositoryProtocol {
    func getCharacters(request: CharactersRequest) async throws -> [Character] {
        return try await dataSource.getCharacters(request: request)
    }
    
    private var dataSource: RemoteCharactersDataSource
    init(dataSource: RemoteCharactersDataSource) {
        self.dataSource = dataSource
    }
}
