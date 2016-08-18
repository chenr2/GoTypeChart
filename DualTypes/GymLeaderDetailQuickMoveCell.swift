//
//  GymLeaderDetailQuickMoveCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailQuickMoveCell: UICollectionViewCell {
    
    var quickMove: QuickAttack? = nil
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementType: UILabel!
    
    // prevents a lot of constraint conflicts
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    }
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let quickMove = quickMove {
            moveName?.text = quickMove.rawValue
            let element = Pokemon.moveForQuickAttack(quickMove).element
            circularView.backgroundColor = Colors.colorForElement(element)
            elementType?.text = element.rawValue
        }
    }
    
}
