//
//  contact.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit


class ContactViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var table: UITableView!
    var dictionary: [cellContact] = []
    var prevent = Set<NSIndexPath>()
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("contact", ofType: "json")
        dictionary = cellContact.loadContact(path!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showHomeController")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe)
        
        
        loadModel()
    }
    
    func showHomeController() {
        self.performSegueWithIdentifier("idHomeDismiss", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let homeView = segue.destinationViewController as! MeViewController
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !prevent.contains(indexPath) {
            prevent.insert(indexPath)
            contactCell.animate(cell)
        }
    }
    
    func numberOfSectionsInTableview(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contacts", forIndexPath: indexPath) as! ContactTableViewCell
        let contact = dictionary[indexPath.row]
        cell.fillContact(contact)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        tableView.separatorColor = UIColor.whiteColor()
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}
