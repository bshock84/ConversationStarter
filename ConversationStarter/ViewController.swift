//
//  ViewController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tests = Test()
    let fetchController = FetchController()
    
    @IBOutlet weak var topicLabel: UILabel!
    let topics = TopicsController()

    @IBAction func helpButton(_ sender: Any) {
    }
    
    @IBAction func settingsButton(_ sender: Any) {
    }
    
    @IBAction func filterTopicsButton(_ sender: Any) {
        navigationItem.title = nil
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let filterVC = storyboard.instantiateViewController(withIdentifier: "filterTableViewController") as! filterTableViewController
        navigationController?.pushViewController(filterVC, animated: true)
        filterVC.topics = topics
        
    }
    
    @IBAction func getNewTopicButton(_ sender: Any) {
        let newTopic: TopicObject = topics.getNewTopic()
        topicLabel.text = newTopic.topicText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Conversation Starter"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let results = fetchController.fetchTopics()
        for result in results {
            print("Topic text is \(result.topicText) \n")
            print("Topic category is \(result.topicCategory)\n\n")
        }

        // Do any additional setup after loading the view, typically from a nib.
        
        //topics.filterTopicCategories()
        print(topics.topicsToSelectFrom)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

