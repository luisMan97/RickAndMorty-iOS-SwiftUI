//
//  CharactersView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    @Environment(\.modelContext) private var modelContext
    @State var viewModel: CharactersViewModel

    var body: some View {
        NavigationStack {
            VStack {
                searchField
                switch viewModel.state {
                case .intial: initialView
                case .loading: skeletonListView
                case .loaded: listView
                case .error: errorView
                case .errorConection: internetErrorView
                }
            }
            .background(Color.primaryGreen)
            .onChange(of: viewModel.searchText) { Task  { await viewModel.search() } }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character,
                                    relatedCharacters: viewModel.getRelatedCharacters(character: character))
            }
            .task { await viewModel.getCharacters() }
        }
        .tint(.white)
    }
}

// MARK: - Private views
private extension CharactersView {
    var searchField: some View {
        SearchField(configuration: .init(text: $viewModel.searchText,
                                         placeholderText: .search))
        .padding(.horizontal)
    }

    var initialView: some View {
        AlertView(configuration: .init(imageName: .magnifyingglass,
                                            imageColor: .primaryGreen,
                                            text: .initialState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    var skeletonListView: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible())],
                      spacing: .gridSpacing) {
                ForEach(0..<10) { _ in
                    CharacterRowSkeletonView()
                }
            }
        }
        .padding(.horizontal)
        .background(Color.primaryGray)
    }

    var listView: some View {
        VStack {
            selectListTypeView
                .padding(.bottom,
                          .selectListTypeViewBottomPadding)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns,
                          spacing: .gridSpacing) {
                    getCharactersView(configuration: .init(alignment: aligment))
                }
            }
        }
        .padding(.top)
        .padding(.horizontal)
        .background(Color.primaryGray)
    }

    var selectListTypeView: some View {
        HStack {
            Spacer()
            Button(action: { viewModel.listType.alternateListType() }, label: {
                Image(systemName: viewModel.listType.alternatedImageName)
                    .frame(.selectListTypeViewImageSize)
            })
            .foregroundColor(Color.black)
            .padding(.trailing)
        }
    }
    
    var errorView: some View {
        AlertView(configuration: .init(imageName: .xCircle,
                                       imageColor: .red,
                                       text: .errorState))
        .padding(.top)
        .background(Color.primaryGray)
    }
    
    var internetErrorView: some View {
        AlertView(configuration: .init(imageName: .wifiExclamationmark,
                                       imageColor: .blue,
                                       text: .internetErrorState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    func getCharactersView(configuration: CharacterRowView.ViewModel.Configuration) -> some View {
        ForEach(viewModel.characters) { character in
            NavigationLink(value: character) {
                CharacterRowView(viewModel:
                        .init(character: character,
                              configuration: configuration,
                              modelContext: modelContext)
                )
            }
        }
    }
}

// MARK: - Shortcuts
private extension CharactersView {
    var columns: [GridItem] {
        switch viewModel.listType {
        case .grid: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible())]
        case .vertical: [GridItem(.flexible())]
        case .gridThreeColumns: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible(), spacing: .zero), GridItem(.flexible())]
        }
    }

    var aligment: CharacterRowView.ViewModel.Alignment {
        viewModel.listType == .vertical ? .horizontal : .vertical
    }
}

// MARK: - String constants
private extension String {
    static let search: String = String(localized: "search")
    static let initialState: String = String(localized: "initial.state")
    static let emptyState: String = String(localized: "empty.state")
    static let errorState: String = String(localized: "error.state")
    static let internetErrorState: String = String(localized: "internet.error.state")
    static let magnifyingglass = "mail.and.text.magnifyingglass"
    static let xCircle = "x.circle"
    static let wifiExclamationmark = "wifi.exclamationmark"
}

// MARK: - Layout constants
private extension CGFloat {
    static let gridSpacing: CGFloat = .zero
    static let selectListTypeViewBottomPadding: CGFloat = 8
    static let selectListTypeViewImageSize: CGFloat = 10
}

//#Preview {
//    ProductsFactory.getProductsView()
//}
