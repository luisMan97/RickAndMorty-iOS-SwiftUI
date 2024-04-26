//
//  URLComponents+QueryItems.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import Foundation

extension URLComponents {

    mutating func setQueryItems(with parameters: [String: Any]) {
        queryItems = parameters.map { .init(name: $0.key, value: $0.value as? String) }
    }
}
