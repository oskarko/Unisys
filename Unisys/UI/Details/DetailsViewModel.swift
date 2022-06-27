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
    private var article: Article

    // MARK: - Lifecycle

    init(_ article: Article) {
        self.article = article
    }
    
    // MARK: - Helpers
    
    func getSourceName() -> String {
        article.source.name
    }
    
    func getTitle() -> String {
        article.title
    }
    
    func getDescription() -> String {
        article.description
    }
    
    func getURLToImageString() -> String {
        article.urlToImage
    }
    
}
