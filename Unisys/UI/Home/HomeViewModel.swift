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
    private var articleItems: [ArticleItem] = []
    private var filteredArticleItems: [ArticleItem] = []
    private var service: HomeServiceProtocol
    private var reachabilityManager: ReachabilityProtocol
    private var coreDataManager: CoreDataProtocol
    
    private var isSearchMode: Bool {
        !filteredArticleItems.isEmpty
    }

    // MARK: - Lifecycle

    init(_ service: HomeServiceProtocol = HomeService(),
         reachabilityManager: ReachabilityProtocol = ReachabilityManager.shared,
         coreDataManager: CoreDataProtocol = CoreDataManager.shared) {
        self.service = service
        self.reachabilityManager = reachabilityManager
        self.coreDataManager = coreDataManager
    }
    
    // MARK: - Helpers
    
    func viewDidLoad() {
        reachabilityManager.isReachable() ? fetchNews() : loadNews()
    }
    
    func numberOfRows(in section: Int) -> Int {
        isSearchMode ? filteredArticleItems.count : articleItems.count
    }
    
    func getNews(at indexPath: IndexPath) -> ArticleItem? {
        let articles = isSearchMode ? filteredArticleItems : articleItems
        guard indexPath.row < articles.count else { return nil }
        
        return articles[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let articles = isSearchMode ? filteredArticleItems : articleItems
        guard indexPath.row < articles.count else { return }
        
        let selectedArticle = articles[indexPath.row]
        router?.showDetails(article: selectedArticle)
    }
    
    func updateSearchResults(for text: String?) {
        if let text = text {
            filteredArticleItems = articleItems.filter({ $0.title?.lowercased().contains(text.lowercased()) ?? false })
        } else {
            filteredArticleItems.removeAll()
        }
        
        view?.reloadData()
    }
}

private extension HomeViewModel {
    
    private func fetchNews() {
        service.fetchNews(completionHandler: { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(newsResponse):
                self.articleItems = newsResponse.articleItems
                self.view?.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
                //self.router?.showAlert(for: .error)
            }
        })
    }
    
    private func loadNews() {
        articleItems = coreDataManager.fetch()
        view?.reloadData()
    }
}
