//
//  Character.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation
import SwiftData

@Model
final class Character: Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let image: String
    var isFavorite: Bool
    
    internal init(id: Int, 
                  name: String,
                  status: String,
                  species: String,
                  type: String? = nil,
                  gender: String,
                  image: String,
                  isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
        self.isFavorite = isFavorite
    }
    
    var imageUrl: URL? { .init(string: image.replacingOccurrences(of: "http:", with: "https:")) }
}

#if DEBUG
extension Character {
    static func mock(id: Int = 1,
                     name: String = "Rick",
                     status: String = "Alive",
                     species: String = "Human",
                     type: String? = nil,
                     gender: String = "Male",
                     image: String = "https://rickandmortyapi.com/api/character/avatar/1.jpeg") -> Self {
        .init(id: id,
              name: name,
              status: status,
              species: species,
              type: type,
              gender: gender,
              image: image)
    }
}
#endif
