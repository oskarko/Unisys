//
//  HomeService.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol HomeServiceProtocol {
    func fetchNews(completionHandler: @escaping (ResultResponse<NewsResponse>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }

    // MARK: - HomeServiceProtocol Functions

    func fetchNews(completionHandler: @escaping (ResultResponse<NewsResponse>) -> Void) {
        let request = HomeRequest.fetchNews
        networkRequester.doRequest(request: request, completionHandler: completionHandler)
    }

}
