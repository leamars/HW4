//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // Actions
    
    // vars
    var textArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        
        tableView.separatorStyle = .None

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell")! as UITableViewCell
        
        cell.textLabel?.textColor = randomColor()
        cell.textLabel?.text = textArray[indexPath.row]
        cell.detailTextLabel?.text = "Index: \(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func returnKeyPressed(sender: AnyObject) {
        if sender as! NSObject == textField {
            if let currentText = textField.text {
                textArray.append(currentText)
            }
            
            tableView.reloadData()
            textField.resignFirstResponder()
        }
    }
    
    func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random_uniform(361))
        let saturation = CGFloat(280)
        let brightness = CGFloat(230)
            
        return UIColor(hue: hue/360, saturation: saturation/360, brightness: brightness/360, alpha: 1.0)
    }
    
    

}

