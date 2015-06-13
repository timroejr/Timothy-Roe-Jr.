//
//  Surprise.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/26/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
import MediaPlayer

class SupriseViewController: UIViewController, UIAlertViewDelegate {
    var moviePlayer: MPMoviePlayerController?
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("IMG_0273", ofType: "mov")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            self.view.addSubview(player.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showHomeController")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe)
        playVideo()
    
    }
    
    func showHomeController() {
        let player = moviePlayer
        player?.stop()
        self.performSegueWithIdentifier("idHomeDismiss", sender: self)
    }
}
