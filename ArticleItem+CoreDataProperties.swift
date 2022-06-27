//
//  ArticleItem+CoreDataProperties.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleItem> {
        return NSFetchRequest<ArticleItem>(entityName: "ArticleItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var image: Data?
    @NSManaged public var sourceName: String?
    @NSManaged public var sourceId: String?
    @NSManaged public var urlToImage: String?

}

extension ArticleItem : Identifiable {

}
