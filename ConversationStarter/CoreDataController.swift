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


class CoreDataController: NSObject {
    
    var managedObjectContext = NSManagedObjectContext()
    
    private override init() {
    
        guard let modelURL = Bundle.main.url(forResource: "AppData", withExtension: "momd") else {
            fatalError("Error loading data from the main bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error creating object model from \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let URL = Bundle.main.resourceURL?.appendingPathComponent("DataStore", isDirectory: true)
            let storeURL = URL?.appendingPathComponent("AppData.sqllite")
            
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
            } catch {
                fatalError("Error migrating store")
            }
        }
        
    }
    static let sharedInstance = CoreDataController()
}
