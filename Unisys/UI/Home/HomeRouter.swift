//  HomeRouter.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class HomeRouter {
    
    // MARK: - Properties
    
    weak var viewController: HomeViewController?

    // MARK: - Helpers
    
    static func getViewController() -> HomeViewController {
        let configuration = configureModule()

        return configuration.vc
    }
    
    private static func configureModule() -> (vc: HomeViewController, vm: HomeViewModel, rt: HomeRouter) {
        let viewController = HomeViewController()
        let router = HomeRouter()
        let viewModel = HomeViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
    func showDetails(article: ArticleItem) {
        DispatchQueue.main.async {
            let detailsView = DetailsRouter.getViewController(for: article)
            self.viewController?.navigationController?.pushViewController(detailsView, animated: true)
        }
    }
    
    func showAlert(error: APIErrorResponse) {
        DispatchQueue.main.async {
            let alertView = AlertRouter.getViewController(error: error)
            alertView.modalPresentationStyle = .custom
            self.viewController?.present(alertView, animated: false)
        }
    }
}
