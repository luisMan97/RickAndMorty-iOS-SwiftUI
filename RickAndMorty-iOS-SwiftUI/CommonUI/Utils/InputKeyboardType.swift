//
//  InputKeyboardType.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 24/04/24.
//

import SwiftUI

public enum InputKeyboardType {
    case `default`
    case number
    case email

    public var keyboard: UIKeyboardType {
        switch self {
        case .`default`: return .default
        case .email: return .emailAddress
        case .number: return .numberPad
        }
    }

    public var textAlignment: TextAlignment { .leading }
}
