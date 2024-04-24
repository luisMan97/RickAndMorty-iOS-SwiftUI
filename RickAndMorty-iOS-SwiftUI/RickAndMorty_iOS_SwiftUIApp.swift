//
//  RickAndMorty_iOS_SwiftUIApp.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Joan Narvaez on 23/04/24.
//

import SwiftUI
import SwiftData

@main
struct RickAndMorty_iOS_SwiftUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
