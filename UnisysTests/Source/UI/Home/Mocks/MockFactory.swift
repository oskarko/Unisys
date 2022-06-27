//
//  MockFactory.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys

class Mockfactory {
    static let shared = Mockfactory()
    
    private init() {}
    
    func generateMockArticles(amount: Int) -> [Article] {
        var mockArticles: [Article] = []
        
        for index in 0...(amount - 1) {
            let mockArticle = Article(source: Source(id: "\(index)", name: "name \(index)"),
                                      title: "title \(index)",
                                      description: "description \(index)",
                                      urlToImage: "url \(index)",
                                      publishedAt: "2022-06-\(27 - index)T12:00:00Z")
            mockArticles.append(mockArticle)
        }
        
        return mockArticles
    }
}
