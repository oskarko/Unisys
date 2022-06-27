//
//  ArticleItem+CoreDataClass.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ArticleItem)
public class ArticleItem: NSManagedObject {

    var article: Article {
        get {
            return Article(source: Source(id: sourceId ?? "", name: sourceName ?? ""),
                           title: title ?? "",
                           description: desc ?? "",
                           urlToImage: urlToImage ?? "",
                           publishedAt: AppDateFormatter.shared.mediumDateTimeString(from: publishedAt ?? Date()))
        }
        set {
            self.sourceId = newValue.source.id
            self.sourceName = newValue.source.name
            self.title = newValue.title
            self.desc = newValue.description
            self.urlToImage = newValue.urlToImage
            self.publishedAt = newValue.publishedAt.convertToDate()
        }
    }
}
