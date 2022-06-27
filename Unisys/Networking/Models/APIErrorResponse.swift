//
//  APIErrorResponse.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct APIErrorResponse: Codable {
    var status: String?
    var code: String?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case status
        case code
        case message
    }

    init(status: String? = nil,
         code: String? = nil,
         message: String? = nil)
    {
        self.status = status
        self.status = status
        self.message = message
    }

    static let badURL: APIErrorResponse = .init(message: NSLocalizedString("Bad URL format", comment: ""))
    static let invalidData: APIErrorResponse = .init(message: NSLocalizedString("Invalid data", comment: ""))
    static let invalidJSON: APIErrorResponse = .init(message: NSLocalizedString("The server response didnt match our model", comment: ""))
}
