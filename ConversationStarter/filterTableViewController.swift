//
//  filterTableViewController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 3/5/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import UIKit

class filterTableViewController: UITableViewController {
    
    let topics = Topics()
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = TopicCategory.topicCategoriesArray.count
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = TopicCategory.topicCategoriesArray[indexPath.row]
        cell.textLabel?.text = category.rawValue
        
        if topics.selectedCategories.contains(category) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            removeCategory(index: indexPath)
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            addCategory(index: indexPath)
        }
    }
    
    func addCategory(index: IndexPath) {
        let category = TopicCategory.topicCategoriesArray[index.row]
        topics.selectedCategories.append(category)
        //print("\n\n\(topics.selectedCategories)\n\n")
        
    }
    
    func removeCategory(index: IndexPath) {
        let category = TopicCategory.topicCategoriesArray[index.row]
        
        if topics.selectedCategories.contains(category) {
            for (index, categoryItem) in topics.selectedCategories.enumerated() {
                if categoryItem == category {
                    topics.selectedCategories.remove(at: index)
                }
            }
        }
        //print("\n\n \(topics.selectedCategories) \n\n")
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
