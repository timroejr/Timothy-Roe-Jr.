//
//  Story.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/19/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import Foundation

class storyCell {
    let imageName: String?
    let headline: String?
    let location: String?
    let story: String?
    let date: String?
    let appStore: String?
    
    init(dictionary:NSDictionary) {
        imageName = dictionary["image"] as? String
        headline = dictionary["headline"] as? String
        location = dictionary["location"] as? String
        //story = dictionary["story"] as? String
        date = dictionary["date"] as? String
        appStore = dictionary["appStore"] as? String
        
        var storyLabelData = dictionary["story"] as? String
        story = storyLabelData?.stringByReplacingOccurrencesOfString("\\n", withString: "\n", options: nil, range: nil)
    }
    
    class func loadStory(path:String) -> [storyCell] {
        var storyCells:[storyCell] = []
        var error:NSError? = nil
        
        if let data = NSData(contentsOfFile: path, options: nil, error: &error), json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSDictionary, story = json["storys"] as? [NSDictionary] {
            for storyDictionary in story {
                let dictionaryStory = storyCell(dictionary: storyDictionary)
                storyCells.append(dictionaryStory)
            }
        }
        return storyCells
    }
}
