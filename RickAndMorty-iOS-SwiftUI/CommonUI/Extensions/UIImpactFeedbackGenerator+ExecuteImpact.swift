//
//  UIImpactFeedbackGenerator+ExecuteImpact.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 24/04/24.
//

import SwiftUI

public extension UIImpactFeedbackGenerator {
    static func executeImpact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        let impact: UIImpactFeedbackGenerator = .init(style: style)
        impact.impactOccurred()
    }
}
