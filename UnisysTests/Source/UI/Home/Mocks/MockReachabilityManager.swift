//
//  MockReachabilityManager.swift
//  UnisysTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import Unisys


class MockReachabilityManager: ReachabilityProtocol {
    
    var connectionType: Reachability.Connection = .unavailable
    
    func isReachable() -> Bool {
        connectionType != .unavailable
    }
    
    func isReachableViaWWAN() -> Bool {
        connectionType == .cellular
    }
    
    func isReachableViaWiFi() -> Bool {
        connectionType == .wifi
    }
}
