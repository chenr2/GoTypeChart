//
//  GymLeaderDetailHeader.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailHeader: UICollectionViewCell {

    var defense: [ElementType] = []
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementName: UILabel!
    
    // prevents a lot of constraint conflicts
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    }
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let singleElement = defense.first where defense.count == 1 {
            circularView.backgroundColor = Colors.colorForElement(singleElement)
        } else if let firstElement = defense.first,
            let lastElement = defense.last
            where defense.count == 2 {
            UIView.animateWithDuration(3, delay: 0.0, options:[UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: {
                self.circularView.backgroundColor = Colors.colorForElement(firstElement)
                self.circularView.backgroundColor = Colors.colorForElement(lastElement)
                }, completion: nil)
        }
        let elementString = defense.map {
            return $0.rawValue
        }.joinWithSeparator(" / ")
        elementName?.text = elementString
    }
    
}
