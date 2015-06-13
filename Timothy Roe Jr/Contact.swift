//
//  Contact.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import Foundation

class cellContact {
    let profileImageName: String?
    let name: String?
    let email: String?
    let number: String?
    let title: String?
    
    init(dictionary:NSDictionary) {
        profileImageName = dictionary["image"] as? String
        name = dictionary["name"] as? String
        email = dictionary ["email"] as? String
        number = dictionary ["number"] as? String
        title = dictionary ["title"] as? String
        
        var contactData = dictionary["contact"] as? String
        
    }
    
    class func loadContact(path:String) -> [cellContact] {
        var contact:[cellContact] = []
        var error:NSError? = nil
        if let data = NSData(contentsOfFile: path, options: nil, error: &error), json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSDictionary, contacts = json["contacts"] as? [NSDictionary] {
            for contactData in contacts {
                let dictionaryData = cellContact(dictionary: contactData)
                contact.append(dictionaryData)
            }
        }
        return contact
    }

}
