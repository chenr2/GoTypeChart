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
    
    @IBOutlet weak var circularView: StatRing!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statTypeLabel: UILabel!
    
    func configureCell(pokemon: Pokemon?, statType: StatType){
        guard let pokemon = pokemon else { return }
        circularView.layer.cornerRadius = bounds.size.width / 2
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
