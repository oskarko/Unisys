//
//  CoreDataManager.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import CoreData
import Foundation

protocol CoreDataProtocol {
    func createArticleItem(with article: Article) -> ArticleItem
    func fetch() -> [ArticleItem]
    func fetch(filter: String?) -> ArticleItem?
}

class CoreDataManager: CoreDataProtocol {
    static let shared = CoreDataManager(modelName: "Unisys")
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { description, error in
//            guard error != nil else {
//                fatalError("CoreDataManager: Error while loading")
//            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An error ocurred while saving: ", error.localizedDescription)
            }
        }
    }
}

extension CoreDataManager {
    func createArticleItem(with article: Article) -> ArticleItem {
        if let articleItem = fetch(filter: article.urlToImage) {
            return articleItem
        } else {
            let articleItem = ArticleItem(context: viewContext)
            articleItem.title = ""
            articleItem.desc = ""
            articleItem.image = nil
            articleItem.publishedAt = Date()
            articleItem.sourceId = ""
            articleItem.sourceName = ""
            
            return articleItem
        }
    }
    
    func fetch() -> [ArticleItem] {
        let request: NSFetchRequest<ArticleItem> = ArticleItem.fetchRequest()
        let sortDescriptor = NSSortDescriptor(keyPath: \ArticleItem.publishedAt, ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return (try? viewContext.fetch(request)) ?? []
    }
    
    func fetch(filter: String?) -> ArticleItem? {
        let request: NSFetchRequest<ArticleItem> = ArticleItem.fetchRequest()
        let sortDescriptor = NSSortDescriptor(keyPath: \ArticleItem.publishedAt, ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        if let filter = filter {
            let predicade = NSPredicate(format: "urlToImage contains[cd] %@", filter)
            request.predicate = predicade
        }
        
        return (try? viewContext.fetch(request).first) ?? nil
    }
}
