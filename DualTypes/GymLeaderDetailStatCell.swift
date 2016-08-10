//
//  GymLeaderDetailStatCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

enum StatType: String {
    case attack = "Attack"
    case defense = "Defense"
    case stamina = "Stamina"
}

class GymLeaderDetailStatCell: UICollectionViewCell {
    
    var pokemon: Pokemon? = nil
    var statType: StatType? = nil
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statTypeLabel: UILabel!
    
    // prevents a lot of constraint conflicts
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    }
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        circularView.layer.borderWidth = 1
        circularView.layer.borderColor = UIColor.darkGrayColor().CGColor
        if let pokemon = pokemon, let statType = statType {
            switch statType {
            case .attack:
                elementType.text = "\(pokemon.attack)"
            case .defense:
                elementType.text = "\(pokemon.defense)"
            case .stamina:
                elementType.text = "\(pokemon.stamina)"                
            }
            statTypeLabel.text = statType.rawValue
        }
    }
    
}