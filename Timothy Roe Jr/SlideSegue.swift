//
//  SlideSegue.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit

class SlideSegue: UIStoryboardSegue {
    
    /* func determineView {
        var id = identifier
        
        switch id {
            case "idFirst":
                let destination = HomeTableViewController() as UIViewController!
            case "idSecond":
                let destination = SchoolViewController() as UIViewController!
            default:
                let destination = HomeTableViewController() as UIViewController!
            
        }
    } */
    
    override func perform() {
        var destination: UIViewController!
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        if var id = defaults.stringForKey("segueId") {
            //let intId: Int? = id.toInt()
            if id == "0" {
                destination = HomeTableViewController() as UIViewController!
                NSLog("HomeView")
            } else if id == "1" {
                destination = SchoolViewController() as UIViewController!
            } else {
                destination = HomeTableViewController() as UIViewController!
                NSLog("Used default")
            }
        }
        
        var viewOne = self.sourceViewController.view as UIView!
        var viewTwo = self.destinationViewController.view as UIView!
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        viewTwo.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(viewTwo, aboveSubview: viewOne)
        UIView.animateWithDuration(0.2, animations: {() -> Void in
            viewOne.frame = CGRectOffset(viewOne.frame, -screenWidth, 0.0)
            viewTwo.frame = CGRectOffset(viewTwo.frame, -screenWidth, 0.0) })
            {(Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController, animated: false, completion: nil)
        }
        
    }
}
