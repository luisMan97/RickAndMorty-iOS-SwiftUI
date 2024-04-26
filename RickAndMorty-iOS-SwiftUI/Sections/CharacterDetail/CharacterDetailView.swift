//
//  CharacterDetailView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI
import SwiftData

struct CharacterDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    let character: Character
    let relatedCharacters: [Character]

    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                title
                image
                textView(text: character.gender)
                textView(text: character.species)
                textView(text: character.status)
                textView(text: character.type ?? "")
                relatedCharactersView
                Spacer()
            }
            .padding(.horizontal, 8)
            .background(Color.white)
            .padding(.top, 1)
        }
        .toolbarRole(.editor)
    }
}

// MARK: - Private views
private extension CharacterDetailView {
    var backgroundColor: some View {
        Color.primaryGreen
            .edgesIgnoringSafeArea(.top)
    }

    var title: some View {
        Text(character.name)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
            .padding(.top)
    }

    var image: some View {
        AsyncImage(url: character.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            CharacterEmptyStateView()
        }
        .frame(200)
    }

    var relatedCharactersView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: .zero) {
                ForEach(relatedCharacters) { character in
                    NavigationLink {
                        CharacterDetailView(character: character,
                                            relatedCharacters: getRelatedCharacters(character: character))
                    } label: {
                        CharacterRowView(viewModel:
                                .init(character: character,
                                      configuration: .init(),
                                      modelContext: modelContext)
                        ).frame(width: 150, height: 250)
                    }
                }
            }
        }.frame(height: 300)
    }
    
    func textView(text: String) -> some View {
        Text(text)
            .font(.body)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }
    
    func getRelatedCharacters(character: Character) -> [Character] {
        relatedCharacters.filter { $0.id != character.id }
    }
}
