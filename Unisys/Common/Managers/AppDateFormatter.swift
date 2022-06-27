//
//  AppDateFormatter.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class AppDateFormatter {
    static let shared = AppDateFormatter()
    
    private init() {}
    
    private let mediumDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        df.locale = Locale.autoupdatingCurrent
        
        return df
    }()
    
    private let mediumTimeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .none
        df.timeStyle = .medium
        df.locale = Locale.autoupdatingCurrent
        
        return df
    }()
    
    private let mediumDateTimeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .medium
        df.locale = Locale.autoupdatingCurrent
        
        return df
    }()
    
    private func dateFrom(string: String) -> Date {
        let df = DateFormatter()
        df.locale = Locale.autoupdatingCurrent
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return df.date(from: string) ?? Date()
    }

    // mediumDate
    
    func mediumDateString(from date: Date) -> String {
        return mediumDateFormatter.string(from: date)
    }
    
    func mediumDateString(from string: String) -> String {
        let date = dateFrom(string: string)
        
        return mediumDateFormatter.string(from: date)
    }
    
    // mediumTime
    func mediumTimeString(from date: Date) -> String {
        return mediumTimeFormatter.string(from: date)
    }
    
    func mediumTimeString(from string: String) -> String {
        let date = dateFrom(string: string)
        
        return mediumTimeFormatter.string(from: date)
    }
    
    // mediumDateTime
    
    func mediumDateTimeString(from date: Date) -> String {
        return mediumDateTimeFormatter.string(from: date)
    }
    
    func mediumDateTimeString(from string: String) -> String {
        let date = dateFrom(string: string)
        
        return mediumDateTimeFormatter.string(from: date)
    }
    
}
