//
//  MockHomeView.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys

class MockHomeView: HomeViewControllerProtocol {
    var viewModel: HomeViewModel!
    
    var isTableViewReloaded: Bool = false
    
    func reloadData() {
        isTableViewReloaded = true
    }
    
}
