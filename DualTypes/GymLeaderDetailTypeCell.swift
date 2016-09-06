//
//  GymLeaderDetailTypeCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailTypeCell: FlexibleCollectionCell {

    var element: ElementType? = nil

    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementType: UILabel!
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let element = element {
            circularView.backgroundColor = Colors.colorForElement(element)
            elementType?.text = NSLocalizedString(element.rawValue, comment: "")
        }
    }
    
}
