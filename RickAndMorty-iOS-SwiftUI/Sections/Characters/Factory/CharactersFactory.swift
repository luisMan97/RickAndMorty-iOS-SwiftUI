//
//  CharactersFactory.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

enum CharactersFactory {

    static func getCharactersView() -> CharactersView {
        // DataSources
        let dataSource = CharactersURLSessionDataSource(apiManager: APIManager())
        // Repository
        let repository = CharactersRepository(dataSource: dataSource)
        // Interactor
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        // ViewModel
        let viewModel = CharactersViewModel(getCharactersUseCase: getCharactersUseCase)
        return CharactersView(viewModel: viewModel)
    }
}

