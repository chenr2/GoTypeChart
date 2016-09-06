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

class GymLeaderDetailStatCell: FlexibleCollectionCell {
    
    var pokemon: Pokemon? = nil
    var statType: StatType? = nil
    
    @IBOutlet weak var circularView: StatRing!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statTypeLabel: UILabel!
    
    override func layoutSubviews() {
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let pokemon = pokemon, let statType = statType {
            switch statType {
            case .attack:
                elementType.text = "\(pokemon.attack)"
                circularView.percent = pokemon.attackPercentage
            case .defense:
                elementType.text = "\(pokemon.defense)"
                circularView.percent = pokemon.defensePercentage
            case .stamina:
                elementType.text = "\(pokemon.stamina)"
                circularView.percent = pokemon.staminaPercentage
            }
            statTypeLabel.text = NSLocalizedString(statType.rawValue, comment: "")
        }
    }
    
}