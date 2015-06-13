//
//  CustomTableViewCell.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/24/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
import QuartzCore
import MapKit

class CustomeTableviewCell: UITableViewCell {
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var locationText: UILabel!
    @IBOutlet var headlineText: UILabel!
    @IBOutlet var dateText: UILabel!
    @IBOutlet var story: UILabel!
    @IBOutlet var view: UIView!
    @IBOutlet var labelAppStore: UILabel!
    @IBOutlet var appStoreButton: UIButton!
    var appStore:String?
    
    func useStory(storyCells:storyCell) {
        //view.layer.cornerRadius = 10;
        //view.layer.masksToBounds = true;
        locationText.text = storyCells.location
        headlineText.text = storyCells.headline
        dateText.text = storyCells.date
        story.text = storyCells.story
        headerImage.image = UIImage(named: storyCells.imageName!)
        //let latitude: Double = NSString(string: storyCells.latitude.text).doubleValue
        //let longitude: Double  = NSString(string: storyCells.longitude.text).doubleValue
        //var lat = (storyCells.latitude as NSString!)
        //var long = (storyCells.longitude as NSString!)
        /*var address = storyCells.location
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(<#addressString: String!#>, completionHandler: <#CLGeocodeCompletionHandler!##([AnyObject]!, NSError!) -> Void#>)
        var location = CLLocationCoordinate2D(latitude: lat.doubleValue, longitude: long.doubleValue)
        var span = MKCoordinateSpanMake(0.01, 0.01)
        var region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true) */
        if let appURL = storyCells.appStore {
            appStoreButton.hidden = false
            labelAppStore.hidden = false
            appStore = appURL
        } else {
            appStoreButton.hidden = true
            labelAppStore.hidden = true
            appStore = nil
        }
        
    }
    
    func goTo(URLString:String?) {
        if let URL = NSURL(string: URLString!) {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    @IBAction func AppStore(sender: AnyObject) {
        goTo(appStore)
    }
}
