//
//  TopicCategory+CoreDataProperties.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 4/14/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import CoreData


extension TopicCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicCategory> {
        return NSFetchRequest<TopicCategory>(entityName: "TopicCategory");
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var categoryToTopicRelationship: NSSet?

}

// MARK: Generated accessors for categoryToTopicRelationship
extension TopicCategory {

    @objc(addCategoryToTopicRelationshipObject:)
    @NSManaged public func addToCategoryToTopicRelationship(_ value: TopicObject)

    @objc(removeCategoryToTopicRelationshipObject:)
    @NSManaged public func removeFromCategoryToTopicRelationship(_ value: TopicObject)

    @objc(addCategoryToTopicRelationship:)
    @NSManaged public func addToCategoryToTopicRelationship(_ values: NSSet)

    @objc(removeCategoryToTopicRelationship:)
    @NSManaged public func removeFromCategoryToTopicRelationship(_ values: NSSet)

}
