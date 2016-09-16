//
//  GymLeaderPokemonCounter.swift
//  DualTypes
//
//  Created by Robert Chen on 9/14/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderPokemonCounter: FlexibleCollectionCell {
    
    @IBOutlet weak var pokemonCounterName: UILabel! // pokemon name
    @IBOutlet weak var quickMoveBubble: UIView!
    @IBOutlet weak var quickMoveName: UILabel!
    @IBOutlet weak var chargeMoveBubble: UIView!
    @IBOutlet weak var chargeMoveName: UILabel!
    
    var pokemonCounter: PokemonCounter? = nil
    
    func configureCell(pokemonCounter: PokemonCounter){
        self.pokemonCounter = pokemonCounter
        pokemonCounterName?.text = NSLocalizedString(pokemonCounter.species.rawValue, comment: "")
        if let quickMove = pokemonCounter.quickMove {
            quickMoveBubble.hidden = false
            let quickMoveElement = QuickMove.moveForQuickAttack(quickMove).element
            quickMoveName?.text = NSLocalizedString(quickMove.rawValue, comment: "")
            quickMoveName?.textColor = Colors.textColorForElement(quickMoveElement)
            quickMoveBubble.backgroundColor = Colors.colorForElement(quickMoveElement)
        } else {
            quickMoveBubble.hidden = true
        }
        if let chargeMove = pokemonCounter.chargeMove {
            chargeMoveBubble.hidden = false
            let chargeMoveElement = SpecialMove.moveForSpecialAttack(chargeMove).element
            chargeMoveName?.text = NSLocalizedString(chargeMove.rawValue, comment: "")
            chargeMoveName?.textColor = Colors.textColorForElement(chargeMoveElement)
            chargeMoveBubble?.backgroundColor = Colors.colorForElement(chargeMoveElement)
        } else {
            chargeMoveBubble.hidden = true 
        }
    }
    
}
