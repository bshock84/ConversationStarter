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
    
    //MARK: IMPORTANT!!!: This is an array that holds a list of all the cases in the above enum.  If you add a case to the enum you MUST add it here in the array as well or the app will not work correctly.
    
//    static let topicCategoriesArray: [TopicCategory] = [.relationship, .personalHistory, .sex, .movies, .music, .hobbies, .books, .sports, .food, .travel, .fashion, .goals, .seasons, .holidays, .education, .politics, .weird, .deep, .family, .miscellaneous, .wouldYouRather]
//    
}

//@objc(TopicObject)
//public class TopicObject: NSManagedObject {
//    
//    static let identifier = "TopicObject"
//    
//    static let topicFetchRequest: NSFetchRequest = { () -> NSFetchRequest<TopicObject> in
//        let request = NSFetchRequest<TopicObject>(entityName: TopicObject.identifier)
//        let sortDescriptor = NSSortDescriptor(key: "topicText", ascending: false)
//        
//        request.sortDescriptors = [sortDescriptor]
//        
//        return request
//    }()

//    let topicCategory: TopicCategory
//    let topicText: String
//    let dontAskAgain: Bool = false
//}

//extension TopicObject {
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicObject> {
//        return NSFetchRequest<TopicObject>(entityName: "TopicObject")
//    }

//    @NSManaged public var topicCategory: NSObject
//    @NSManaged public var topicText: String
//    @NSManaged public var dontAskAagain: Bool
    
//}   

class TopicsController {
    
    var topicsToSelectFrom: [TopicObject] = []
    private var previouslyUsedTopicIndeces: [Int] = []
    let alertController = AlertController()
    var selectedCategories: [TopicCategoryEnum] = [.goals, .weird, .books]
    let dataController = DataController.sharedInstance
    
    func loadTopicsFromDatabase() {
        
    }
    
    func saveTopicsToDatabase() {
        
    }
    
    func getNewTopic() -> TopicObject {
        
        let index: Int = getRandomIndex()
        return topicsToSelectFrom[index]
    }
    
    func addNewTopic(category: TopicCategoryEnum, text: String) {
        let newTopic = NSEntityDescription.insertNewObject(forEntityName: TopicObject.identifier, into: dataController.managedObjectContext) as! TopicObject
        newTopic.topicText = text
        newTopic.topicToCategoryRelationship = category.rawValue
        
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
    
//    func filterTopicCategories() {
//        for topic in allTopics {
//            if selectedCategories.contains(topic.topicCategory) {
//                topicsToSelectFrom.append(topic)
//            }
//        }
//        
//    }
    
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



























