//
//  GymLeaderDetailTypeCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailTypeCell: UICollectionViewCell {

    var element: ElementType? = nil

    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementType: UILabel!
    
    // prevents a lot of constraint conflicts
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    }
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let element = element {
            elementType?.text = element.rawValue
        }
    }
    
}
