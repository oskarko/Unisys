//  DetailsViewModel.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    // MARK: - Properties
    
    weak var view: DetailsViewControllerProtocol?
    var router: DetailsRouter?
    private var article: ArticleItem

    // MARK: - Lifecycle

    init(_ article: ArticleItem) {
        self.article = article
    }
    
    // MARK: - Helpers
    
    func getSourceName() -> String {
        article.sourceName ?? ""
    }
    
    func getTitle() -> String {
        article.title ?? ""
    }
    
    func getDescription() -> String {
        article.desc ?? ""
    }
    
    func getURLToImageString() -> String {
        article.urlToImage ?? ""
    }
    
    func getDateString() -> String {
        AppDateFormatter.shared.mediumDateTimeString(from: article.publishedAt ?? Date())
    }
    
}
