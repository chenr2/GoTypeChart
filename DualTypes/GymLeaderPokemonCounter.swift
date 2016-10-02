//
//  GymLeaderPokemonCounter.swift
//  DualTypes
//
//  Created by Robert Chen on 9/14/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderPokemonCounter: FlexibleCollectionCell {
    
    @IBOutlet weak var typeBonus: UILabel! // defense
    @IBOutlet weak var pokemonCounterName: UILabel! // pokemon name
    @IBOutlet weak var quickMoveBubble: UIView!
    @IBOutlet weak var quickMoveName: UILabel!
    @IBOutlet weak var chargeMoveBubble: UIView!
    @IBOutlet weak var chargeMoveName: UILabel!
    
    var typeResult: TypeResult? = nil
    
    func configureCell(_ typeResult: TypeResult){
        self.typeResult = typeResult
        pokemonCounterName?.text = NSLocalizedString(typeResult.opponent.species.rawValue, comment: "")
        let quickMove = typeResult.opponentQuickMove
        let quickMoveElement = quickMove.element
        quickMoveName?.text = NSLocalizedString(quickMove.quickAttack.rawValue, comment: "")
        quickMoveName?.textColor = Colors.textColorForElement(quickMoveElement)
        quickMoveBubble.backgroundColor = Colors.colorForElement(quickMoveElement)
        let chargeMove = typeResult.opponentChargeMove
        let chargeMoveElement = chargeMove.element
        chargeMoveName?.text = NSLocalizedString(chargeMove.specialAttack.rawValue, comment: "")
        chargeMoveName?.textColor = Colors.textColorForElement(chargeMoveElement)
        chargeMoveBubble?.backgroundColor = Colors.colorForElement(chargeMoveElement)
        typeBonus?.text = String(format: "+%.1f", typeResult.sumDifferential)
    }
    
}
