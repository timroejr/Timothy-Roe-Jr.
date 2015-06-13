//
//  StartUpViewController.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/19/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var knowMeLabel: UILabel!
    @IBOutlet var finalInstructions: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLabel.alpha = 0
        self.knowMeLabel.alpha = 0
        self.finalInstructions.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        welcomeLabel.center.x = self.view.bounds.height
        welcomeLabel.center.y = self.view.bounds.width
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(2.5, animations: { () -> Void in self.welcomeLabel.alpha = 1.0})
        UIView.animateWithDuration(3.0, delay: 1.5, options: nil, animations: {(self.welcomeLabel.center.y = self.view.bounds.width / 4)}, completion: nil)
        UIView.animateWithDuration(3.0, delay: 2.0, options: nil, animations: {(self.knowMeLabel.alpha = 1.0)}, completion: nil)
        UIView.animateWithDuration(3.0, delay: 5.0, options: nil, animations: {(self.finalInstructions.alpha = 1.0)}, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
