//
//  TestTopics.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 4/14/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation



var testTopics: [(category: TopicCategoryEnum, text: String)] = [
    (category: .weird, text: "Time freezes for everyone except you for one day; What do you do?"),
    (category: .food, text: "What is your favorite food?"),
    (category: .education, text: "What do you think about online education?"),
    (category: .education, text: "How can technology improve education? Can it hurt it?"),
    (category: .holidays, text: "What's the biggest holiday for your family?"),
    (category: .seasons, text: "What's the most refreshing thing on a hot summer day?"),
    (category: .goals, text: "What's the craziest, most outrageous thing you want to accomplish?"),
    (category: .goals, text: "Have your parents influenced the goals you have?"),
    (category: .fashion, text: "Do you care about fasion?  What style do you usually wear?"),
    (category: .relationship, text: "What was your longest relationship?"),
    (category: .sex, text: "What's your favorite position?"),
    (category: .movies, text: "What's your favorite type of movie?"),
    (category: .music, text: "If you could go see any band/artist dead or alive, who would it be?"),
    (category: .hobbies, text: "What is your weirdest hobby?"),
    (category: .books, text: "If you could write a book today, what would it be titled?  What would it be about?"),
    (category: .sports, text: "What's a sport that you just don't get?"),
    (category: .travel, text: "If you could to go anywhere in the world tommorrow, money no object, where would you go?"),
    (category: .politics, text: "Who is a political figure, dead or alive, that you look up to?"),
    (category: .weird, text: "If you mind was an island, what would it look like?"),
    (category: .wouldYouRather, text: "Would you rather always be 10 minutes late, or 20 minutes early?"),
    (category: .deep, text: "What are the highest and lowest points of your life?"),
    (category: .miscellaneous, text: "This is a misc question?")
]

class Test {
    func addAllTestCases() {
        let topicController = TopicsController()
        for item in testTopics {
            topicController.addNewTopic(category: item.category, text: item.text)        }
    }
}
