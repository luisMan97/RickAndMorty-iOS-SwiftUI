//
//  CharacterRowView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI
import SwiftData

struct CharacterRowView: View {
    @Environment(\.modelContext) private var modelContext
    
    var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            switch viewModel.configuration.alignment {
            case .horizontal: horizontalBodyView
            case .vertical: verticalBodyView
            }
            Button(action: addToFavorite, label: {
                favoriteImage
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .padding(8)
            })
        }
    }
}

// MARK: - Private views
private extension CharacterRowView {
    var horizontalBodyView: some View {
        VStack {
            HStack {
                bodyView
            }
            Divider()
        }
        .padding(.horizontal, 8)
        .background(Color.white)
    }

    private var verticalBodyView: some View {
        VStack {
            bodyView
        }
        .padding(.horizontal, 8)
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .border(.gray,
                 width: 0.2)
    }

    @ViewBuilder
    var bodyView: some View {
        image
        contentView
        Spacer()
    }

    @ViewBuilder
    var image: some View {
        AsyncImage(url: viewModel.character.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            CharacterEmptyStateView()
        }
    }

    var contentView: some View {
        VStack(alignment: .leading) {
            nameView
            textView(text: viewModel.character.gender)
            textView(text: viewModel.character.species)
            textView(text: viewModel.character.status)
            textView(text: viewModel.character.type ?? "")
        }
    }
    
    var nameView: some View {
        Text(viewModel.character.name)
            .font(.body)
            .fontWeight(.bold)
            .foregroundStyle(.blackIntermediate)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }
    
    func textView(text: String) -> some View {
        Text(text)
            .font(.body)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }
}

private extension CharacterRowView {
    var favoriteImage: Image {
        Image(systemName: viewModel.getCharacter(id: viewModel.character.id).isFavorite ? "heart.fill" : "heart")
    }
}

private extension CharacterRowView {
    private func addToFavorite() {
        if viewModel.getCharacter(id: viewModel.character.id).isFavorite {
            removeFavorite()
            return
        }
        withAnimation {
            viewModel.character.isFavorite = true
            modelContext.insert(viewModel.character)
        }
    }
    
    private func removeFavorite() {
        let character = viewModel.getCharacter(id: viewModel.character.id)
        withAnimation {
            viewModel.getCharacter(id: viewModel.character.id).isFavorite = false
            viewModel.character.isFavorite = false
            modelContext.delete(character)
        }
    }
}

//#Preview {
//    CharacterRowView(product: Products.mock(), configuration: .init())
//}
