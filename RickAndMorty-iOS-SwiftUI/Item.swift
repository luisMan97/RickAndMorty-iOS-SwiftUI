//
//  Item.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Joan Narvaez on 23/04/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
