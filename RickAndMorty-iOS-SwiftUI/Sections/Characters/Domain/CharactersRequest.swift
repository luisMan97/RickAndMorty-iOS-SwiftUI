//
//  CharactersRequest.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

struct CharactersRequest: Encodable {
    let character: String

    enum CodingKeys: String, CodingKey {
        case character = "name"
    }
}
