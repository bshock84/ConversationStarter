//
//  filterTableViewController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 3/5/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    var topics: TopicsController?
    
    
    func setupToolbar() {
        let allButton = UIBarButtonItem.init(title: "All", style: .plain, target: self, action: #selector(selectAllCategories))
        
        let noneButton = UIBarButtonItem.init(title: "None", style: .plain, target: self, action: #selector(deselectAllCategories))
        
        let spacerButton = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        self.setToolbarItems([allButton, spacerButton, noneButton], animated: true)
        navigationController?.isToolbarHidden = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBackToPreviousViewController))
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //setupToolbar()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToolbar()
        
        
        
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
        
        // This is just a safety check to make sure that the topics instance from the main view controller is
        // actually being pushed to this view controller, and this topics instance isn't nil.  This is done so
        // that you can force unwrap the topics variable without having to use guard checks.
        if topics == nil {
            print("Wasn't able to push the topics instance from main view controller")
            _ = navigationController?.popViewController(animated: true)
            let alertController = AlertController()
            alertController.showStandardAlert(alertTitle: "Error Loading Categories", alertMessage: "There was an unresolved error loading the list of categories.  Please contact support.")
            return 0
        }
        let numberOfRows = TopicCategoryEnum.topicCategoriesArray.count
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = TopicCategoryEnum.topicCategoriesArray[indexPath.row].rawValue
        cell.textLabel?.text = category
        
        if topics!.selectedCategories.contains(category) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                setCheckmarkFalse(indexPath: indexPath)
            } else {
                setCheckmarkTrue(indexPath: indexPath)
            }
        
    }
    
    func selectAllCategories() {
        let totalRows = tableView.numberOfRows(inSection: 0)
        for row in 0..<totalRows {
            tableView.selectRow(at: IndexPath.init(row: row, section: 0), animated: true, scrollPosition: .none)
            setCheckmarkTrue(indexPath: IndexPath.init(row: row, section: 0))
        }
        
    }
    
    func deselectAllCategories() {
        let totalRows = tableView.numberOfRows(inSection: 0)
        for row in 0..<totalRows {
            tableView.selectRow(at: IndexPath.init(row: row, section: 0), animated: true, scrollPosition: .none)
            setCheckmarkFalse(indexPath: IndexPath.init(row: row, section: 0))
        }
    }
    
    func setCheckmarkTrue(indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        topics!.addCategory(index: indexPath)
        topics!.filterTopicCategories()
    }
    
    func setCheckmarkFalse(indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        topics!.removeCategory(index: indexPath)
        topics!.filterTopicCategories()
    }
    
    func goBackToPreviousViewController() {
        if topics?.selectedCategories.count == 0 {
            let alertController = AlertController()
            alertController.showStandardAlert(alertTitle: "No Categories Selected", alertMessage: "You Must Select At Least One(1) Category")
        } else {
            _ = navigationController?.popViewController(animated: true)
        }
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
