//
//  ViewController.swift
//  TP1
//
//  Created by user on 23.11.15.
//  Copyright © 2015 user. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITextFieldDelegate
{
    
    var task : Task?
    
    @IBOutlet weak var taskNameEdit: UITextField!
    @IBOutlet weak var urgentButton: UISwitch!
    
    @IBOutlet weak var saveTask: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameEdit.text = ""
        urgentButton.setOn(false, animated: false)
        
        // Handle the text field’s user input through delegate callbacks.
        taskNameEdit.delegate = self
        
        // Set up views if editing an existing Meal.
        if let task = task {
            taskNameEdit.text   = task.description
            if task.image != nil{
                urgentButton.setOn(true, animated: false)
            }
            else
            {
                urgentButton.setOn(false, animated: false)
            }
        }
        checkValidMealName()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveTask.enabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = taskNameEdit.text ?? ""
        saveTask.enabled = !text.isEmpty
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Navigation
    
    
    @IBAction func cancel(sender: AnyObject) {
        let isPresentingInAddTaskMode = presentingViewController is UINavigationController
        if isPresentingInAddTaskMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveTask === sender
        {
            task = Task()
            if urgentButton.on
            {
                task!.image = UIImage(named: "point")
            }
            task!.description = taskNameEdit.text ?? ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

