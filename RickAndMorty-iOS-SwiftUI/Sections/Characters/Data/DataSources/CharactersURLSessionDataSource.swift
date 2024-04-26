//
//  CharactersURLSessionDataSource.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//


struct CharactersURLSessionDataSource: RemoteCharactersDataSource {

    private(set) var apiManager: APIManagerProtocol

    func getCharacters(request: CharactersRequest) async throws -> [Character] {
        try await (apiManager.request(service: .Characters(request)) as SearchResponse).toCharacters()
    }
}
