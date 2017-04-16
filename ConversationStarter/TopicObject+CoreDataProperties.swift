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

    @NSManaged public var dontAskAgain: Bool
    @NSManaged public var topicText: String
    @NSManaged public var topicCategory: String

}
