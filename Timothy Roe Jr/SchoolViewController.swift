//
//  SchoolViewController.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/25/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
import MapKit

class SchoolViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var webButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showHomeController")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe)
        /* var location = CLLocationCoordinate2D(latitude: 34.095452, longitude: -117.653211)
        var span = MKCoordinateSpanMake(0.01, 0.01)
        var region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Western Christian High School"
        annotation.subtitle = "120 W. 9th St., Upland, CA"
        mapView.addAnnotation(annotation) */
        
        
    }
    
    func showHomeController() {
        self.performSegueWithIdentifier("idHomeDismiss", sender: self)
    }
    
    @IBAction func openSafari(sender: AnyObject) {
        let URL = NSURL(string: "http://www.westernchristian.org")
        UIApplication.sharedApplication().openURL(URL!)
    }

}
