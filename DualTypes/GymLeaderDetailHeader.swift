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
    
    override func layoutSubviews() {
        let elementString = defense.map {
            return $0.rawValue
        }.joinWithSeparator(" / ")
        elementName?.text = elementString
    }
    
}
