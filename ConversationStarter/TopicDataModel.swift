//
//  TopicDataModel.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import GameKit

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
    
    //MARK: These are test cases.  They need to be removed and added to the database before publishing app.
    
    var allTopics: [TopicObject] = [
        TopicObject.init(topicCategory: .weird, topicText: "Time freezes for everyone except you for one day; What do you do?"),
        TopicObject.init(topicCategory: .food, topicText: "What is your favorite food?"),
        TopicObject.init(topicCategory: .education, topicText: "What do you think about online education?"),
        TopicObject.init(topicCategory: .education, topicText: "How can technology improve education? Can it hurt it?"),
        TopicObject.init(topicCategory: .holidays, topicText: "What's the biggest holiday for your family?"),
        TopicObject.init(topicCategory: .seasons, topicText: "What's the most refreshing thing on a hot summer day?"),
        TopicObject.init(topicCategory: .goals, topicText: "What's the craziest, most outrageous thing you want to accomplish?"),
        TopicObject.init(topicCategory: .goals, topicText: "Have your parents influenced the goals you have?"),
        TopicObject.init(topicCategory: .fashion, topicText: "Do you care about fasion?  What style do you usually wear?"),
        TopicObject.init(topicCategory: .relationship, topicText: "What was your longest relationship?"),
        TopicObject.init(topicCategory: .sex, topicText: "What's your favorite position?"),
        TopicObject.init(topicCategory: .movies, topicText: "What's your favorite type of movie?"),
        TopicObject.init(topicCategory: .music, topicText: "If you could go see any band/artist dead or alive, who would it be?"),
        TopicObject.init(topicCategory: .hobbies, topicText: "What is your weirdest hobby?"),
        TopicObject.init(topicCategory: .books, topicText: "If you could write a book today, what would it be titled?  What would it be about?"),
        TopicObject.init(topicCategory: .sports, topicText: "What's a sport that you just don't get?"),
        TopicObject.init(topicCategory: .travel, topicText: "If you could to go anywhere in the world tommorrow, money no object, where would you go?"),
        TopicObject.init(topicCategory: .politics, topicText: "Who is a political figure, dead or alive, that you look up to?"),
        TopicObject.init(topicCategory: .weird, topicText: "If you mind was an island, what would it look like?"),
        TopicObject.init(topicCategory: .wouldYouRather, topicText: "Would you rather always be 10 minutes late, or 20 minutes early?"),
        TopicObject.init(topicCategory: .deep, topicText: "What are the highest and lowest points of your life?"),
        TopicObject.init(topicCategory: .miscellaneous, topicText: "This is a misc question?")
    ]
    
    var topicsToSelectFrom: [TopicObject] = []
    private var previouslyUsedTopicIndeces: [Int] = []
    var selectedCategories: [TopicCategory] = [.goals, .weird, .books]
    
    func loadTopicsFromDatabase() {
        
    }
    
    func saveTopicsToDatabase() {
        
    }
    
    func getNewTopic() -> TopicObject {
        let index: Int = getRandomIndex()
        return topicsToSelectFrom[index]
    }
    
    func addNewTopic(newTopic: TopicObject) {
        
    }
    
    func listTopicsByCategory(category: TopicCategory) -> [TopicObject] {
        
        var topicByCategory: [TopicObject] = []
        
        for topic in allTopics {
            if topic.topicCategory == category {
                topicByCategory.append(topic)
            }
        }
        return topicByCategory
    }
    
    func filterTopicCategories() {
        for topic in allTopics {
            if selectedCategories.contains(topic.topicCategory) {
                topicsToSelectFrom.append(topic)
            }
        }
        
    }
    
    private func getRandomIndex() -> Int {
        var didFindNumber = false
        var randomIndex: Int = 0
        
        while didFindNumber == false {
            randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: topicsToSelectFrom.count)
            
            if previouslyUsedTopicIndeces.contains(randomIndex) {
                if topicsToSelectFrom.count == previouslyUsedTopicIndeces.count {
                    previouslyUsedTopicIndeces = []
                    print("\n**** End of array has been reached.  Starting over.****\n")
                } else {
                    didFindNumber = false
                }
            } else {
                didFindNumber = true
                previouslyUsedTopicIndeces.append(randomIndex)
            }
            
        }
        
        return randomIndex
    }
    
    
}



























