//
//  Encodable+Dictionary.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import Foundation

extension Encodable {

    var dictionary: [String: Any]? {
        guard let data = toJSONData() else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
