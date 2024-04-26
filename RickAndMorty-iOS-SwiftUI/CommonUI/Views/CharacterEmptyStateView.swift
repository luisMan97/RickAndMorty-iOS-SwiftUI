//
//  CharacterEmptyStateView.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 24/04/24.
//

import SwiftUI

struct CharacterEmptyStateView: View {
    var size: CGFloat = 50

    var body: some View {
        Image(systemName: "figure.fall.circle")
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(.linearGradient(colors: [.gray.opacity(0.6), .gray.opacity(0.3)], startPoint: .top, endPoint: .bottomLeading))
            .font(.system(size: size))
            .padding(25)
    }
}

#Preview {
    CharacterEmptyStateView()
}
