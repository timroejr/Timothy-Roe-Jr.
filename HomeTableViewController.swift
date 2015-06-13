//
//  HomeTableViewController.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/19/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
//import CustomCell


class HomeTableViewController: UITableViewController {
    var dictionary: [storyCell] = []
    var prevent = Set<NSIndexPath>()
    let navBarColor = UIColor(red: 19/255, green: 149/255, blue: 1, alpha: 0.75)
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("Story", ofType: "json")
        dictionary = storyCell.loadStory(path!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = navBarColor
        navigationController?.hidesBarsOnSwipe = true
        self.tableView.backgroundView = UIImageView(image:UIImage(named: "background"))
        self.tableView.backgroundView!.contentMode = UIViewContentMode.ScaleAspectFill
        self.tableView.estimatedRowHeight = 399
        self.tableView.rowHeight = UITableViewAutomaticDimension
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showHomeController")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe)
        loadModel()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let homeView = segue.destinationViewController as! MeViewController
        
    }
    
    func showHomeController() {
        self.performSegueWithIdentifier("idHomeDismiss", sender: self)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !prevent.contains(indexPath) {
            prevent.insert(indexPath)
            StoryCell.animate(cell)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("story", forIndexPath: indexPath) as! CustomeTableviewCell
        let story = dictionary[indexPath.row]
        cell.useStory(story)
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

}