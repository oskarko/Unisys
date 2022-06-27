//
//  MockHomeRouter.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys

class MockHomeRouter: HomeRouter {
    var isDetailsPresented: Bool = false
    var isCustomAlertPresented: Bool = false
    var article: ArticleItem?
    var error: APIErrorResponse?

    override func showDetails(article: ArticleItem) {
        isDetailsPresented = true
        self.article = article
    }
    
    override func showAlert(error: APIErrorResponse) {
        isCustomAlertPresented = true
        self.error = error
    }
}
