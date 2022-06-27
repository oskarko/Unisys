//
//  String+Ext.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let df = DateFormatter()
        df.locale = Locale.autoupdatingCurrent
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return df.date(from: self)
    }
}
