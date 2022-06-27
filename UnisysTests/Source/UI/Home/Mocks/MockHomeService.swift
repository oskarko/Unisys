//
//  MockHomeService.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys

class MockHomeService: HomeServiceProtocol {
    
    var success: Bool = true
    var amount: Int = 0
    
    
    func fetchNews(completionHandler: @escaping (ResultResponse<NewsResponse>) -> Void) {
        if success {
            let response: NewsResponse = .init(status: "ok",
                                               totalResults: amount,
                                               articles: Mockfactory.shared.generateMockArticles(amount: amount))
            completionHandler(.success(response))
        } else {
            let error = APIErrorResponse(message: "Mock Error")
            completionHandler(.failure(error))
        }
    }
    
}
