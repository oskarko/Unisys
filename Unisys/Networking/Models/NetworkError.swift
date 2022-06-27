//
//  NetworkError.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case badURL
    case invalidData
    case error401
    case error404
    case error500
    case invalidJSON
    case `default`(description: String? = nil)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badURL: return NSLocalizedString("Bad URL format", comment: "")
        case .invalidData: return NSLocalizedString("Invalid data", comment: "")
        case .error401: return NSLocalizedString("Error 401: Unauthorized", comment: "")
        case .error404: return NSLocalizedString("Error 404: Not found", comment: "")
        case .error500: return NSLocalizedString("Error 500: Server down", comment: "")
        case .invalidJSON: return NSLocalizedString("The server response didnt match our model", comment: "")
        case let .default(description): return description ?? "Something went wrong"
        }
    }
}
