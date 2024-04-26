//
//  CharacterRowView+Configuration.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

extension CharacterRowView.ViewModel {

    struct Configuration {
        var alignment: Alignment

        init(alignment: Alignment = .vertical) {
            self.alignment = alignment
        }
    }
}

extension CharacterRowView.ViewModel {

    enum Alignment {
        case horizontal
        case vertical
    }
}
