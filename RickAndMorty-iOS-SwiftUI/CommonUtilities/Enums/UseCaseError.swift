//
//  UseCaseError.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

enum UseCaseError: Error {
    case networkError, decodingError

    public var localizedDescription: String {
        switch self {
        case .networkError:
            return "Verifica tu conexión a internet e intenta nuevamente."
        case .decodingError:
            return "Ha ocurrido un error, inténtalo en unos minutos."
        }
    }
}
