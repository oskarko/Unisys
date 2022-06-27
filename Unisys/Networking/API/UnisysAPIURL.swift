//
//  UnisysAPIURL.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum UnisysAPIURL: String {
    #if DEBUG
    case newsRoot = "https://newsapi.org"
    #else
    case newsRoot = "https://pro.newsapi.org"
    #endif

    var convertedURL: URL {
        guard let url = URL(string: rawValue) else {
            assertionFailure("Incorrect format of URL")
            return URL(string: "")!
        }
        
        return url
    }
}
