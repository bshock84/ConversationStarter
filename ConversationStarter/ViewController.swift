//
//  ViewController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topicLabel: UILabel!
    let topics = Topics()

    @IBAction func helpButton(_ sender: Any) {
    }
    
    @IBAction func settingsButton(_ sender: Any) {
    }
    
    @IBAction func filterTopicsButton(_ sender: Any) {
    }
    
    @IBAction func getNewTopicButton(_ sender: Any) {
        let newTopic: TopicObject = topics.getNewTopic()
        topicLabel.text = newTopic.topicText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topics.filterTopicCategories()
        print(topics.topicsToSelectFrom)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

