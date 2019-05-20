//
//  CoreDataManager.swift
//  JobTracker
//
//  Created by Thong Hoang Nguyen on 2019-05-16.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JobTrackerModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let err = error {
                fatalError("Loading of persistent store failed: \(err)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let saveErr {
                let err = saveErr as NSError
                fatalError("Unresolved error \(err), \(err.userInfo)")
            }
        }
    }
}
