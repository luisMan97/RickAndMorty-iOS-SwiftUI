//
//  RickAndMorty_iOS_SwiftUIApp.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import SwiftUI
import SwiftData

@main
struct RickAndMorty_iOS_SwiftUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Character.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                CharactersFactory.getCharactersView()
                    .tabItem {
                        Label("Personajes", systemImage: "list.dash")
                    }
                FavoriteCharacters(viewModel: .init())
                    .tabItem {
                        Label("Favoritos", systemImage: "heart.fill")
                    }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
