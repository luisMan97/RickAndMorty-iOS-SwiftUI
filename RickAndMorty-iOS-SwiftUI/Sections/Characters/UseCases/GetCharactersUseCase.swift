//
//  GetCharactersUseCase.swift.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol GetCharactersUseCaseProtocol {
    func invoke(request: CharactersRequest) async -> Result<[Character], UseCaseError>
}

struct GetCharactersUseCase: GetCharactersUseCaseProtocol {

    // Repository
    private var repository: CharactersRepositoryProtocol

    // MARK: - Initializers

    init(repository: CharactersRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func invoke(request: CharactersRequest) async -> Result<[Character], UseCaseError> {
        do {
            let characters = try await repository.getCharacters(request: request)
            return .success(characters)
        } catch {
            return .failure(ServiceError.handleError(error))
        }
    }
}
