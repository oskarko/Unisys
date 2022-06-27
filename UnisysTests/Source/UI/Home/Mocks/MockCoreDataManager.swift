//
//  MockCoreDataManager.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys

class MockCoreDataManager: CoreDataProtocol {
    
    var amount: Int = 0
    
    func createArticleItem(with article: Article) -> ArticleItem {
        if let articleItem = fetch(filter: article.urlToImage) {
            return articleItem
        } else {
            let articleItem = ArticleItem()
            articleItem.title = ""
            articleItem.desc = ""
            articleItem.image = nil
            articleItem.sourceId = ""
            articleItem.sourceName = ""
            
            return articleItem
        }
    }
    
    func fetch() -> [ArticleItem] {
        return Mockfactory.shared.generateMockArticles(amount: amount).compactMap { article in
            let articleItem = ArticleItem()
            articleItem.article = article

            return articleItem
        }
    }
    
    func fetch(filter: String?) -> ArticleItem? {
        guard let filter = filter else {
            return nil
        }

        return fetch().filter({ $0.title!.contains(filter) }).first
    }
}
