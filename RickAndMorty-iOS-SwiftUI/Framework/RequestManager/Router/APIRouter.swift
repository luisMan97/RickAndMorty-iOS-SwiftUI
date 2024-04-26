//
//  APIRouter.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 23/04/24.
//

import Foundation

enum APIRouter {

    case Characters(Encodable)

    private var method: HTTPMethod {
        switch self {
        case .Characters:
            return .get
        }
    }

    private var path: String {
        switch self {
        case .Characters(let model):
            return "character/".queryString(params: model.dictionary ?? [:])
        }
    }

    private var url: String { APIConstants.endpoint }

    private var urlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else { return nil }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }

    var request: URLRequest? {
        switch self {
        case .Characters:
            return urlRequest
        }
    }
}

