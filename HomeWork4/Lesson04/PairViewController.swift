//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class PairViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    // actions
    
    // vars
    
    var peopleDictionary : [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleDictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("peopleCell")! as UITableViewCell
        
        let key = Array(peopleDictionary.keys)[indexPath.row]
        
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = peopleDictionary[key]
        
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func surnameReturnPressed(sender: AnyObject) {
        
        if sender as! NSObject == nameTextField {
            if let nameText = emailTextField.text, surnameText = nameTextField.text {
                peopleDictionary[nameText] = surnameText
            }
            
            tableView.reloadData()
            nameTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == nameTextField {
            if let nameText = emailTextField.text, surnameText = nameTextField.text {
                peopleDictionary[nameText] = surnameText
            }
            
            tableView.reloadData()
            nameTextField.resignFirstResponder()
            emailTextField.text = ""
            nameTextField.text = ""
            
        } else if textField == nameTextField {
            emailTextField.resignFirstResponder()
            nameTextField.becomeFirstResponder()
        }
        
        return false
    }
    
    func keyboardWillShow() {
        emailTextField.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        nameTextField.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
    }
    
    func keyboardWillHide() {
        emailTextField.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
        nameTextField.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
    }
}

