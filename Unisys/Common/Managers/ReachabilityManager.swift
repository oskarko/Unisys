//
//  ReachabilityManager.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol ReachabilityProtocol {
    func isReachable() -> Bool
    func isReachableViaWWAN() -> Bool
    func isReachableViaWiFi() -> Bool
}

class ReachabilityManager: ReachabilityProtocol {
    
    private var reachability: Reachability?
    
    static let shared = ReachabilityManager()
    
    private init() {
        do {
            reachability = try Reachability()
        } catch {
            print("Unable to init ReachabilityManager")
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    func startNotifier() {
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func stopNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    func isReachable() -> Bool {
        reachability?.connection != .unavailable
    }
    
    func isReachableViaWWAN() -> Bool {
        reachability?.connection == .cellular
    }
    
    func isReachableViaWiFi() -> Bool {
        reachability?.connection == .wifi
    }
}
