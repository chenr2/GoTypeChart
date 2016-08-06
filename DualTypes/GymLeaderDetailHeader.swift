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
        }
        let elementString = defense.map {
            return $0.rawValue
        }.joinWithSeparator(" / ")
        elementName?.text = elementString
    }
    
}
