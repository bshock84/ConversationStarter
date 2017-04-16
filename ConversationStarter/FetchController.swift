//
//  FetchedResultsController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 4/2/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import UIKit
import CoreData






//class FetchedResultsController: NSFetchedResultsController<TopicObject>, NSFetchedResultsControllerDelegate {
//    private var tableView: UITableView
//    
//    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
//        self.tableView = tableView
//        super.init()
//        
//        self.delegate = self
//    }
//}


class FetchController {
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    let topicFetchRequest = NSFetchRequest<TopicObject>(entityName: TopicObject.identifier)
    
    func fetchTopics() -> [TopicObject] {
        
        do {
            let results = try managedObjectContext.fetch(topicFetchRequest) 
            return results
        } catch {
            fatalError("Failed to load the topics from the database \(error)")
        }
        
    }
}






















