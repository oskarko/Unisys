//  AlertViewModel.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class AlertViewModel {
    
    // MARK: - Properties
    
    weak var view: AlertViewControllerProtocol?
    var router: AlertRouter?
    private var error: APIErrorResponse
    
    init(_ error: APIErrorResponse) {
        self.error = error
    }
    
    // MARK: - Helpers
    
    func getInfoText() -> String {
        error.message ?? ""
    }
    
    func acceptButtonTapped() {
        router?.dismiss()
    }
}
