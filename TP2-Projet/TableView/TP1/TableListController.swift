//
//  TableListController.swift
//  TP1
//
//  Created by user on 23.11.15.
//  Copyright © 2015 user. All rights reserved.
//

import UIKit

class TableListController: UITableViewController {

    //MARK: Properties
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load any saved meals, otherwise load sample data.
        if let savedTasks = loadTasks() {
            tasks += savedTasks
        } else {
            // Load the sample data.
            loadSampleTask()
        }
    }
    
    func loadSampleTask()
    {
        let photo1 = UIImage(named: "point")!
        let task1 = Task(name:"Do this exercise",image:photo1)!
        
        tasks += [task1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier 
        let cellIdentifier = "TaskListCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TaskListCell
        
        // Fetches the appropriate meal for the data source layout.
        let currTask = tasks[indexPath.row]
        
        cell.nameLabel.text = currTask.name
        cell.pictureImageView.image = currTask.image
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tasks.removeAtIndex(indexPath.row)
            saveTask()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail"
        {
            let taskDetailViewController = segue.destinationViewController as! TaskViewController
            
            // Get the cell that generated this segue.
            if let selectedTaskCell = sender as? TaskListCell
            {
                let indexPath = tableView.indexPathForCell(selectedTaskCell)!
                let selectedTask = tasks[indexPath.row]
                taskDetailViewController.task = selectedTask
            }
        }
        else if segue.identifier == "AddTask"
        {
            print("Adding new task.")
        }
    }
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.sourceViewController as? TaskViewController, task = sourceViewController.task
        {
            // Update an existing task.
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                tasks[selectedIndexPath.row] = task
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            // Add a new task.
            else
            {
                let newIndexPath = NSIndexPath(forRow: tasks.count, inSection: 0)
                tasks.append(task)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            //Save the task
            saveTask()
        }
    }
    
    //MARK: NSCoding
    
    func saveTask(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(tasks, toFile: Task.ArchiveURL.path!)
        if !isSuccessfullSave{
            print("Failed to save meals...")
        }
    }
    
    func loadTasks() -> [Task]?{
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Task.ArchiveURL.path!) as? [Task]
    }
}
