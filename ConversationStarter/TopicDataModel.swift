//
//  TopicDataModel.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation

//struct TopicObject {
//    var topicCategory: String
//    var topicsArray: [String]
//}
//
//class Topics {
//    
//    var allTopics: [TopicObject] = [
//                                    TopicObject.init(topicCategory: "Relationship Topics", topicsArray: [
//                                        "What's your favorite position",
//                                        "How many partners have you had?"
//                                        ])
//    ]
//    
//}


enum TopicCategory: String {
    case relationship = "Relationships"
    case personalHistory = "Personal History"
    case sex = "Sex"
    case movies = "Movies"
    case music = "Music"
    case hobbies = "Hobbies"
    case books = "Books"
    case sports = "Sports"
    case food = "Food"
    case travel = "Travel"
    case fasion = "Fasion"
    case goals = "Goals"
    case seasons = "Seasons"
    case holidays = "Holidays"
    case education = "Education"
    case politics = "Politics"
    case weird = "Weird"
    case deep = "Deep"
    case family = "Family"
    case miscellaneous = "Miscellaneous"
    
    
    
}

struct TopicObject {
    let topicCategory: TopicCategory
    let topicText: String
    let dontAskAgain: Bool = false
}
