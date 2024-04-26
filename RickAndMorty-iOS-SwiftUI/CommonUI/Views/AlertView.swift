//
//  AlertView.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 24/04/24.
//

import SwiftUI

struct AlertView: View {
    var configuration: Configuration

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Image(systemName: configuration.imageName)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.linearGradient(colors: [configuration.imageColor.opacity(0.6),
                                                          configuration.imageColor.opacity(0.3)],
                                                 startPoint: .top,
                                                 endPoint: .bottomLeading))
                .font(.system(size: 100))
            Text(configuration.text)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
            Spacer()
        }
    }
}

extension AlertView {
    struct Configuration {
        let imageName: String
        let imageColor: Color
        let text: String

        init(imageName: String,
              imageColor: Color = .gray,
              text: String) {
            self.imageName = imageName
            self.imageColor = imageColor
            self.text = text
        }
    }
}

#Preview {
    AlertView(configuration: .init(imageName: "mail.and.text.magnifyingglass",
                                        text: "Realiza una busqueda para encontrar productos."))
}
