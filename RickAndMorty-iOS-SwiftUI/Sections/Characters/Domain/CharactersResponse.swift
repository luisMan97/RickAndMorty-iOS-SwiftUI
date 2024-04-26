//
//  CharactersResponse.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

struct CharactersResponse: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let image: String
}

extension CharactersResponse {
    func toDomain() -> Character {
        .init(id: id,
              name: name,
              status: status,
              species: species,
              type: type,
              gender: gender,
              image: image)
    }
}
