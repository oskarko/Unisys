//  HomeViewModel.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?
    private var articles: [Article] = []
    private var service: HomeServiceProtocol

    // MARK: - Lifecycle

    init(_ service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    // MARK: - Helpers
    
    func fetchNews() {
        service.fetchNews(completionHandler: { [weak self] result in
            guard let self = self else { return }

            //HUDManager.dismiss()
            switch result {
            case let .success(newsResponse):
                self.articles = newsResponse.articles
                self.view?.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
                //self.router?.showAlert(for: .error)
            }
        })
    }
    
    func numberOfRows(in section: Int) -> Int {
        articles.count
    }
    
    func getNews(at indexPath: IndexPath) -> Article? {
        guard indexPath.row < articles.count else { return nil }
        
        return articles[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < articles.count else { return }
        
        let selectedArticle = articles[indexPath.row]
        router?.showDetails(article: selectedArticle)
    }
}
