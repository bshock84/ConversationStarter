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
    let openingText = "Welcome to Conversation Starter! \n\nPress \"Get New Topic\" to load a random topic.  \n\nPress \"Filter Topics\" to choose which categories to use.\n"
    
    @IBOutlet weak var topicLabel: UILabel!
    let topics = TopicsController()

    @IBAction func helpButton(_ sender: Any) {
    }
    
    @IBAction func settingsButton(_ sender: Any) {
    }
    
    @IBAction func filterTopicsButton(_ sender: Any) {
        navigationItem.title = nil
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let filterVC = storyboard.instantiateViewController(withIdentifier: "FilterTableViewController") as! FilterTableViewController
        navigationController?.pushViewController(filterVC, animated: true)
        
        // Pushing this topics instance to the FilterTableViewController
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


        // Do any additional setup after loading the view, typically from a nib.
        
        topics.filterTopicCategories()
        print(topics.topicsToSelectFrom)
        
        topicLabel.text = openingText
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

