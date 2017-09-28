//
//  CoreDataStack.swift
//  CoreDataHelloWorld
//
//  Created by Diego Freniche Brito on 13/09/2017.
//  Copyright © 2017 Diego Freniche Brito. All rights reserved.
//

import CoreData

public class CoreDataStack {
    public func createContainer(dbName: String) -> NSPersistentContainer {
        let container = NSPersistentContainer(name: dbName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print("💾 \( storeDescription.description )")
            //  ¯\_(ツ)_/¯
            if let error = error as NSError? {
                fatalError("💩 Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }
    
    public func saveContext(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
