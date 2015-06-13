//
//  OppositeSlideSegue.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit

class OppositeSlideSegue: UIStoryboardSegue {
    override func perform() {
        var viewTwo = self.sourceViewController.view as UIView!
        var viewOne = self.destinationViewController.view as UIView!
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(viewOne, aboveSubview: viewTwo)
        UIView.animateWithDuration(0.4, animations: {() -> Void in
            viewOne.frame = CGRectOffset(viewOne.frame, screenWidth, 0.0)
            viewTwo.frame = CGRectOffset(viewTwo.frame, screenWidth, 0.0) })
            {(Finished) -> Void in
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
