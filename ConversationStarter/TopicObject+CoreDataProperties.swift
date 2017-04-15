//
//  TopicObject+CoreDataProperties.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 4/14/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import CoreData


extension TopicObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicObject> {
        return NSFetchRequest<TopicObject>(entityName: "TopicObject");
    }

    @NSManaged public var dontAskAgain: Bool
    @NSManaged public var topicText: String?
    @NSManaged public var topicToCategoryRelationship: TopicCategory?

}
