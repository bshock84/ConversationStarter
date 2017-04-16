//
//  TopicDataModel.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import GameKit
import CoreData


// The TopicCategoryEnum is to prevent using stringly typed categories to help prevent errors.
// I recomend using it's raw value whenever you need to reference a category

enum TopicCategoryEnum: String {
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
    case truthOrDare = "Truah Or Dare" //  MARK: IMPORTANT Keep this case out of the topicCategoriesArray!!
    
    //MARK: IMPORTANT!!!: This is an array that holds a list of all the cases in the above enum.  If you add a case to the enum you MUST add it here in the array as well or the app will not work correctly.
    
    static let topicCategoriesArray: [TopicCategoryEnum] = [.relationship, .personalHistory, .sex, .movies, .music, .hobbies, .books, .sports, .food, .travel, .fashion, .goals, .seasons, .holidays, .education, .politics, .weird, .deep, .family, .miscellaneous, .wouldYouRather]
    
}


class TopicsController {
    
    var topicsToSelectFrom: [TopicObject] = []
    private var previouslyUsedTopicIndeces: [Int] = []
    let alertController = AlertController()
    var selectedCategories: [String] = [TopicCategoryEnum.goals.rawValue, TopicCategoryEnum.weird.rawValue, TopicCategoryEnum.books.rawValue]
    let dataController = DataController.sharedInstance
    let fetchController = FetchController()
    
    func addCategory(index: IndexPath) {
        let category = TopicCategoryEnum.topicCategoriesArray[index.row].rawValue
        selectedCategories.append(category)
        print("\n\n\(selectedCategories)\n\n")
        
    }
    
    func removeCategory(index: IndexPath) {
        let category = TopicCategoryEnum.topicCategoriesArray[index.row].rawValue
        
        if selectedCategories.contains(category) {
            for (index, categoryItem) in selectedCategories.enumerated() {
                if categoryItem == category {
                    selectedCategories.remove(at: index)
                }
            }
        }
        print("\n\n \(selectedCategories) \n\n")
    }
    
    func getNewTopic() -> TopicObject {
        
        let index: Int = getRandomIndex()
        return topicsToSelectFrom[index]
    }
    
    func addNewTopic(category: TopicCategoryEnum, text: String) {
        let newTopic = NSEntityDescription.insertNewObject(forEntityName: TopicObject.identifier, into: dataController.managedObjectContext) as! TopicObject
        newTopic.topicText = text
        newTopic.topicCategory = category.rawValue
        
        dataController.saveContext()
    }
    
//    func listTopicsByCategory(category: TopicCategory) -> [TopicObject] {
//        
//        var topicByCategory: [TopicObject] = []
//        
//        for topic in allTopics {
//            if topic.topicCategory == category {
//                topicByCategory.append(topic)
//            }
//        }
//        return topicByCategory
//    }
    
    func filterTopicCategories() {
        fetchController.topicFetchRequest.predicate = NSPredicate(format: "ANY topicCategory IN %@", selectedCategories)
        topicsToSelectFrom = fetchController.fetchTopics()
        for topic in topicsToSelectFrom {
            print(topic.topicCategory)
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
                    alertController.showStandardAlert(alertTitle: "End of Topics", alertMessage: "You have read all the topics.  Starting over.")
                    
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



























