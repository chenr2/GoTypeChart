//
//  DetailTitleControl.swift
//  DualTypes
//
//  Created by Robert Chen on 9/24/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class DetailTitleControl: UIView {
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var quickMoveBubble: UIView!
    @IBOutlet weak var quickMoveName: UILabel!
    @IBOutlet weak var chargeMoveBubble: UIView!
    @IBOutlet weak var chargeMoveName: UILabel!
    
    func configureTitleControl(pokemon: Pokemon, quickAttack: QuickAttack, specialAttack: SpecialAttack){
        let pokemonLocalizedName = NSLocalizedString(pokemon.species.rawValue, comment: "")
        pokemonName.text = "#\(pokemon.pokedex) \(pokemonLocalizedName)"
        quickMoveName.text = NSLocalizedString(quickAttack.rawValue, comment: "")
        let quickMove = QuickMove.moveForQuickAttack(quickAttack)
        quickMoveBubble.backgroundColor = Colors.colorForElement(quickMove.element)
        quickMoveName.textColor = Colors.textColorForElement(quickMove.element)
        chargeMoveName.text = NSLocalizedString(specialAttack.rawValue, comment: "")
        let chargeMove = SpecialMove.moveForSpecialAttack(specialAttack)
        chargeMoveBubble.backgroundColor = Colors.colorForElement(chargeMove.element)
        chargeMoveName.textColor = Colors.textColorForElement(chargeMove.element)
    }
}
