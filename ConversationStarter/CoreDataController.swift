//
//  CoreDataController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 3/9/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import UIKit
import CoreData


public class DataController: NSObject {
    
    static let sharedInstance = DataController()
    
    private override init() {
        
    }
    
    private lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.last!
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
       let modelURL = Bundle.main.url(forResource: "AppData", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    private lazy var persistantStoreCoordinator: NSPersistentStoreCoordinator = {
       let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("AppData.sqllite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            let userInfo: [String: Any] = [
                NSLocalizedDescriptionKey: " Failed to initialize the saved data",
                NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the application's saved data",
                NSUnderlyingErrorKey: error as NSError
            ]
            let wrappedError = NSError(domain: "com.ShockedStudios.CoreDataError", code: 9999, userInfo: userInfo)
            print("Unresolved Error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    }()
    
    public lazy var managedObjectContext: NSManagedObjectContext = {
       let coordinator = self.persistantStoreCoordinator
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    public func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("saved")
            } catch {
                let userInfo: [String: Any] = [
                    NSLocalizedDescriptionKey: "Failed to save the managedObjectContext to disk",
                    NSLocalizedFailureReasonErrorKey: "there was an error saving the managedObjectContext to the persistent store.",
                    NSUnderlyingErrorKey: error
                ]
                
                let wrappedError = NSError(domain: "com.ShockedStudios.CoreDataError", code: 9998, userInfo: userInfo)
                print("Unresolved Error \(wrappedError), \(wrappedError.userInfo)")
                abort()
                
            }
        }
    }
}














