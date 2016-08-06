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

    @IBOutlet weak var elementType: UILabel!
    
    override func layoutSubviews() {
        if let element = element {
            elementType?.text = element.rawValue
        }
    }
}
