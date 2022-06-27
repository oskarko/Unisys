//
//  HomeViewModelTests.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys
import XCTest

class HomeViewModelTests: XCTestCase {
    
    var homeView: MockHomeView!
    var homeViewModel: HomeViewModel!
    var homeService: MockHomeService!
    var reachabilityManager: MockReachabilityManager!
    var coreDataManager: MockCoreDataManager!
    var homeRouter: MockHomeRouter!

    override func setUp() {
        homeView = MockHomeView()
        homeService = MockHomeService()
        reachabilityManager = MockReachabilityManager()
        coreDataManager = MockCoreDataManager()
        homeViewModel = HomeViewModel(homeService,
                                      reachabilityManager: reachabilityManager,
                                      coreDataManager: coreDataManager)
        homeRouter = MockHomeRouter()

        homeView.viewModel = homeViewModel

        homeViewModel.view = homeView
        homeViewModel.router = homeRouter
    }

    override func tearDown() {
        homeView = nil
        homeViewModel = nil
        homeService = nil
        reachabilityManager = nil
        coreDataManager = nil
        homeRouter = nil
    }
    
    func test_viewDidLoad_reachability_withSuccess() throws {
        // Given
        let amount: Int = 7
        homeView.isTableViewReloaded = false
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .wifi
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let viewModelAmount = homeViewModel.numberOfRows(in: 0)

        // Then
        XCTAssertTrue(homeView.isTableViewReloaded)
        XCTAssertFalse(homeRouter.isCustomAlertPresented)
        XCTAssertTrue(viewModelAmount == amount)
    }
    
    func test_viewDidLoad_reachability_withError() throws {
        // Given
        let amount: Int = 7
        homeView.isTableViewReloaded = false
        homeService.success = false
        homeService.amount = amount
        reachabilityManager.connectionType = .wifi
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let viewModelAmount = homeViewModel.numberOfRows(in: 0)

        // Then
        XCTAssertFalse(homeView.isTableViewReloaded)
        XCTAssertTrue(homeRouter.isCustomAlertPresented)
        XCTAssertTrue(viewModelAmount == .zero)
    }
    
    func test_numberOfRows_withSuccess() throws {
        // Given
        let amount: Int = 4
        homeView.isTableViewReloaded = false
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .cellular
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let viewModelAmount = homeViewModel.numberOfRows(in: 0)

        // Then
        XCTAssertTrue(homeView.isTableViewReloaded)
        XCTAssertFalse(homeRouter.isCustomAlertPresented)
        XCTAssertTrue(viewModelAmount == amount)
    }
    
    func test_numberOfRows_withError() throws {
        // Given
        let amount: Int = 4
        homeView.isTableViewReloaded = false
        homeService.success = false
        homeService.amount = amount
        reachabilityManager.connectionType = .wifi
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let viewModelAmount = homeViewModel.numberOfRows(in: 0)

        // Then
        XCTAssertFalse(homeView.isTableViewReloaded)
        XCTAssertTrue(homeRouter.isCustomAlertPresented)
        XCTAssertTrue(viewModelAmount == .zero)
    }
    
    func test_getNews_withSuccess() throws {
        // Given
        let amount: Int = 2
        homeView.isTableViewReloaded = false
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .wifi
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let articleItem: ArticleItem? = homeViewModel.getNews(at: IndexPath(row: 0, section: 0))

        // Then
        XCTAssertFalse(homeRouter.isCustomAlertPresented)
        XCTAssertNotNil(articleItem)
    }
    
    func test_getNews_withError() throws {
        // Given
        let amount: Int = 2
        homeView.isTableViewReloaded = false
        homeService.success = false
        homeService.amount = amount
        reachabilityManager.connectionType = .wifi
        homeRouter.isCustomAlertPresented = false

        // when
        homeViewModel.viewDidLoad()
        let articleItem: ArticleItem? = homeViewModel.getNews(at: IndexPath(row: 4, section: 0))

        // Then
        XCTAssertFalse(homeView.isTableViewReloaded)
        XCTAssertTrue(homeRouter.isCustomAlertPresented)
        XCTAssertNil(articleItem)
    }
    
    func test_didSelectRow_withSuccess() throws {
        // Given
        let amount: Int = 14
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .cellular
        homeRouter.isCustomAlertPresented = false
        homeRouter.isDetailsPresented = false

        // when
        homeViewModel.viewDidLoad()
        homeViewModel.didSelectRow(at: IndexPath(row: 10, section: 0))

        // Then
        XCTAssertTrue(homeRouter.isDetailsPresented)
    }
    
    func test_didSelectRow_withError() throws {
        // Given
        let amount: Int = 14
        homeView.isTableViewReloaded = false
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .cellular
        homeRouter.isCustomAlertPresented = false
        homeRouter.isDetailsPresented = false

        // when
        homeViewModel.viewDidLoad()
        homeViewModel.didSelectRow(at: IndexPath(row: 20, section: 0))

        // Then
        XCTAssertFalse(homeRouter.isDetailsPresented)
    }
    
    func test_updateSearchResults() throws {
        // Given
        let amount: Int = 8
        homeView.isTableViewReloaded = false
        homeService.success = true
        homeService.amount = amount
        reachabilityManager.connectionType = .cellular
        homeRouter.isCustomAlertPresented = false
        homeRouter.isDetailsPresented = false

        // when
        homeViewModel.viewDidLoad()
        homeViewModel.updateSearchResults(for: "title \(1)")
        let viewModelAmount = homeViewModel.numberOfRows(in: 0)
        let articleItem: ArticleItem? = homeViewModel.getNews(at: IndexPath(row: 0, section: 0))

        // Then
        XCTAssertTrue(homeView.isTableViewReloaded)
        XCTAssertEqual(articleItem?.title, "title \(1)")
        XCTAssertEqual(viewModelAmount, 1)
    }

}
