//
//  CharacterRowViewModel.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 25/04/24.
//

import Foundation
import SwiftData

extension CharacterRowView {
    
    class ViewModel {
        private(set) var character: Character
        private(set) var configuration: Configuration
        private var modelContext: ModelContext
        
        init(character: Character,
             configuration: Configuration,
             modelContext: ModelContext) {
            self.character = character
            self.configuration = configuration
            self.modelContext = modelContext
        }
        
        func getCharacter(id: Int) -> Character {
            do {
                let predicate = #Predicate<Character> { object in
                    object.id == id
                }
                var descriptor = FetchDescriptor(predicate: predicate)
                descriptor.fetchLimit = 1
                let object = try modelContext.fetch(descriptor)
                return object.first ?? character
            } catch {
                return character
            }
        }
    }
}
