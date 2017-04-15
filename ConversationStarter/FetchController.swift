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






class FetchedResultsController: NSFetchedResultsController<TopicObject>, NSFetchedResultsControllerDelegate {
    private var tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.delegate = self
    }
}























