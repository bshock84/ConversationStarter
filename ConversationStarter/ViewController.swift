//
//  ViewController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 2/25/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topics = Topics()

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

