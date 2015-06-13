//
//  MeViewController.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/24/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var jobTitle: UILabel!
    @IBOutlet var officialTitle: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    let array = ["My Story and Technical Experience", "My School", "Contact Me or My School", "Shake it Off..."]
    
    override func viewDidLoad() {
        self.profile.layer.cornerRadius = self.profile.frame.size.width/2
        self.profile.clipsToBounds = true
        super.viewDidLoad()
        
        tableView.delegate = self
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var id: String?
        id = segue.identifier
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
         super.viewDidAppear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = array[row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.separatorColor = UIColor.whiteColor()
        tableView.scrollEnabled = false
        return cell
    }
    
    @IBAction func returnFromSegue(sender: UIStoryboardSegue) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = indexPath.row
        let defaults = NSUserDefaults.standardUserDefaults()
        var stgCell = String(cell)
        defaults.setObject(stgCell, forKey: "segueId")
        defaults.synchronize()
        if stgCell == "0" {
            self.performSegueWithIdentifier("idFirst", sender: self)
        } else if stgCell == "1" {
            self.performSegueWithIdentifier("idSecond", sender: self)
        } else if stgCell == "2" {
            self.performSegueWithIdentifier("idThird", sender: self)
        } else if stgCell == "3" {
            self.performSegueWithIdentifier("idFourth", sender: self)
        } else {
            self.performSegueWithIdentifier("idFirst", sender: self)
            NSLog("Default, Unknown IndexPath")
        }
}

    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "idHomeDismiss" {
                let returnHome = OppositeSlideSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: {() -> Void in })
                return returnHome
            
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
}
