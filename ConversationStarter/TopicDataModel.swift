//
//  TopicDataModel.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation

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
    case fashion = "Fashion"
    case goals = "Goals"
    case seasons = "Seasons"
    case holidays = "Holidays"
    case education = "Education"
    case politics = "Politics"
    case weird = "Weird"
    case deep = "Deep"
    case family = "Family"
    case miscellaneous = "Miscellaneous"
    case wouldYouRather = "Would You Rather"
    
    //MARK: IMPORTANT!!!: This is an array that holds a list of all the cases in the above enum.  If you add a case to the enum you MUST add it here in the array as well or the app will not work correctly.
    
    static let topicCategoriesArray: [TopicCategory] = [.relationship, .personalHistory, .sex, .movies, .music, .hobbies, .books, .sports, .food, .travel, .fashion, .goals, .seasons, .holidays, .education, .politics, .weird, .deep, .family, .miscellaneous, .wouldYouRather]
    
}

struct TopicObject {
    let topicCategory: TopicCategory
    let topicText: String
    let dontAskAgain: Bool = false
}

class Topics {
    
    var allTopics: [TopicObject] = [
        TopicObject.init(topicCategory: .weird, topicText: "Time freezes for everyone except you for one day; What do you do?"),
        TopicObject.init(topicCategory: .food, topicText: "What is your favorite food?"),
        TopicObject.init(topicCategory: .education, topicText: "What do you think about online education?")
    ]
}
