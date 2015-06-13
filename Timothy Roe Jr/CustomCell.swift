//
//  CustomCell.swift
//  Timothy Roe Jr
//
//  Created by Timothy Roe Jr. on 4/19/15.
//  Copyright (c) 2015 Timothy Roe Jr. All rights reserved.
//

import UIKit
import QuartzCore

let StartTransform:CATransform3D = {
    let rotationDegrees: CGFloat = -15.0
    let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
    let offset = CGPointMake(-20, -20)
    var startTransform = CATransform3DIdentity
    startTransform = CATransform3DRotate(CATransform3DIdentity, rotationRadians, 0.0, 0.0, 1.0)
    startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
    return startTransform
} ()

class StoryCell {
    class func animate(cell:UITableViewCell) {
        let view = cell.contentView
        
        view.layer.transform = StartTransform
        view.layer.opacity = 0.1
        
        UIView.animateWithDuration(0.4) {
            
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
}
