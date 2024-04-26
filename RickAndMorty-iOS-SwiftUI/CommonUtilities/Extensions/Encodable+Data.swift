//
//  Encodable+Data.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import Foundation

extension Encodable {

    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
