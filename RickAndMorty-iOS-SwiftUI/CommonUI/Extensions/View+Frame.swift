//
//  View+Frame.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 24/04/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func frame(_ length: CGFloat) -> some View {
        frame(width: length, height: length)
    }
}
