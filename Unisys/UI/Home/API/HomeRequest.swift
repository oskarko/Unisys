//
//  HomeRequest.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum HomeRequest {
    case fetchNews
}

extension HomeRequest: APIRequest {

    var path: APIPath {
        switch self {
        case .fetchNews: return .news
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchNews: return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .fetchNews:
                return [URLQueryItem(name: "apiKey", value: Constants.API_KEY),
                        URLQueryItem(name: "domains", value: Constants.PUBLIC_DOMAINS)]
        }
    }
}
