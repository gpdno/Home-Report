//
//  CoreData.swift
//  Home Report
//
//  Created by Andi Setiyadi on 12/31/15.
//  Copyright © 2015 PFI. All rights reserved.
//

import Foundation
import CoreData

class CoreData {
    let model = "Home Report"
    
    private lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        
        return urls[urls.count-1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.model, withExtension: "momd")!
        
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    private lazy var persistenceStoreCoordinator: NSPersistentStoreCoordinator = {
        let corrdinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(self.model)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true]
            
            try corrdinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options)
        }
        catch {
            fatalError("error adding persistence store")
        }
        
        return corrdinator
    }()
    
    lazy var managedOjbectContext: NSManagedObjectContext = {
       var context = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistenceStoreCoordinator
        return context
    }()
    
    func saveContext () {
        if managedOjbectContext.hasChanges {
            do {
                try managedOjbectContext.save()
            }
            catch {
                fatalError("error saving context")
            }
        }
    }
}

