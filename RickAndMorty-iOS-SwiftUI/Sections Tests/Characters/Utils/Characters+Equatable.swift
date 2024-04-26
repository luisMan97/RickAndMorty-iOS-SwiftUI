//
//  Characters+Equatable.swift
//  RickAndMorty-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

@testable import RickAndMorty_iOS_SwiftUI

extension Character {

    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}
