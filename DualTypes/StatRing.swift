//
//  StatRing.swift
//  DualTypes
//
//  Created by Robert Chen on 8/11/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class StatRing: UIView {

    var percent: CGFloat = 0 
    
    let units = 2 * π / 100
    
    let arcColor: UIColor = UIColor.darkGrayColor()
    
    // https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
    override func drawRect(rect: CGRect) {
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 5
        let startAngle: CGFloat = 3 * π / 2
        let endAngle: CGFloat = percent * units + startAngle
        // background ring
        let pathBackground = UIBezierPath(arcCenter: center,
                                          radius: radius/2 - arcWidth/2,
                                          startAngle: 0,
                                          endAngle: 2 * π,
                                          clockwise: true)
        pathBackground.lineWidth = arcWidth
        arcColor.colorWithAlphaComponent(0.3).setStroke()
        pathBackground.stroke()
        // stat ring
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = arcWidth
        arcColor.setStroke()
        path.stroke()
    }

}
