//
//  String+QueryItems.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import Foundation

extension String {
    func queryString(params: [String: Any]) -> String {
        var components = URLComponents(string: self)
        components?.setQueryItems(with: params)
        return components?.url?.absoluteString ?? self
    }
}
