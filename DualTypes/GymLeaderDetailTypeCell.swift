//
//  GymLeaderDetailTypeCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailTypeCell: FlexibleCollectionCell {

    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementType: UILabel!
    
    func configureCell(element: ElementType) {
        circularView.layer.cornerRadius = bounds.size.width / 2
        circularView.backgroundColor = Colors.colorForElement(element)
        elementType?.text = NSLocalizedString(element.rawValue, comment: "")
    }
    
}
