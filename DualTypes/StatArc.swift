//
//  StatArc.swift
//  DualTypes
//
//  Created by Robert Chen on 8/17/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class StatArc: UIView {
    
    var percent: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    let units = 2 * π * ( 2 / 3 ) / 100
    
    func drawArc(_ endPercent: CGFloat, backgroundArc: Bool){
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 5
        let startAngle: CGFloat = 5 * π / 6
        let endAngle: CGFloat = endPercent * units + startAngle
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = arcWidth
        if backgroundArc {
            let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
            backgroundColor.setStroke()
        } else {
            UIColor.white.setStroke()
        }
        path.stroke()
    }
    
    // https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
    override func draw(_ rect: CGRect) {
        drawArc(100, backgroundArc: true)
        drawArc(percent, backgroundArc: false)
    }
    
}
