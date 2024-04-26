//
//  RemoteCharactersDataSource.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol RemoteCharactersDataSource {
    func getCharacters(request: CharactersRequest) async throws -> [Character]
}
