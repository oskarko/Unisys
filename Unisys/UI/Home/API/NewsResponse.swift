//
//  NewsResponse.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    var articleItems: [ArticleItem] {
        return articles.compactMap { article in
            let articleItem = CoreDataManager.shared.createArticleItem(with: article)
            articleItem.article = article
            
            return articleItem
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String
    let urlToImage: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case description
        case urlToImage
        case publishedAt
    }
}

struct Source: Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
