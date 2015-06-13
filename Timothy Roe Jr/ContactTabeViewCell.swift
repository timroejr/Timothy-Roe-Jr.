//
//  ContactTabeViewCell.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
import QuartzCore
import MessageUI

class ContactTableViewCell: UITableViewCell, MFMailComposeViewControllerDelegate {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var phoneButton: UIButton!
    
    func dial(URLString:String?) {
        if let URL = NSURL(string: "tel:\(URLString)") {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    
    @IBAction func telephone(sender: AnyObject) {
        dial(number.text)
    }
    func fillContact(contact:cellContact) {
        name.text = contact.name
        email.text = contact.email
        number.text = contact.number
        title.text = contact.title
        profileImage.image = UIImage(named: contact.profileImageName!)
        
        /*func sendEmail(eAddress:String?, sender: AnyObject) {
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }
               
        } */
        
        
    
    }
}
