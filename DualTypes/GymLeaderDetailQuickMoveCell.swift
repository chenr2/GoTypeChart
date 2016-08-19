//
//  GymLeaderDetailQuickMoveCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailQuickMoveCell: FlexibleCollectionCell {
    
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statArc: StatRing!
    @IBOutlet weak var elementBubble: UIView!
    @IBOutlet weak var dpsStat: UILabel!
    
    func attributedStabBonus(dps: CGFloat, elementColor: UIColor, stab: Bool) -> NSMutableAttributedString {
        let mainAttributes = [
            NSForegroundColorAttributeName : UIColor.darkGrayColor()
        ]
        let dpsNumberString = String(format: "%.1f", dps)
        let mainString = "DPS: \(dpsNumberString)"
        let mainAttributedString = NSMutableAttributedString(string: mainString, attributes:mainAttributes)
        if stab {
            let stabValue = dps * 0.25
            let stabValueString = String(format: "%.1f", stabValue)
            let bonusText = " +\(stabValueString)"
            let bonusAttributes = [
                NSForegroundColorAttributeName : Colors.blue
            ]
            let bonusAttributedString = NSMutableAttributedString(string: bonusText, attributes: bonusAttributes)
            mainAttributedString.appendAttributedString(bonusAttributedString)
        }
        return mainAttributedString
    }
    
    func configureCell(quickAttack: QuickAttack, pokemon: Pokemon){
        let move = Pokemon.moveForQuickAttack(quickAttack)
        let element = move.element
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = quickAttack.rawValue
        elementType?.text = element.rawValue
        statArc.percent = move.quickMovePercentage(CGFloat(pokemon.attack), stab: stabFlag)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        let dps = move.dps
        dpsStat?.attributedText = attributedStabBonus(dps, elementColor: elementColor, stab: stabFlag)
    }
    
    func configureCellSpecial(specialAttack: SpecialAttack, pokemon: Pokemon){
        let move = Pokemon.moveForSpecialAttack(specialAttack)
        let element = move.element
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = specialAttack.rawValue
        elementType?.text = element.rawValue
        statArc.percent = move.specialMovePercentage(CGFloat(pokemon.attack), stab: stabFlag)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        let dps = move.dps
        dpsStat?.attributedText = attributedStabBonus(dps, elementColor: elementColor, stab: stabFlag)
    }

}
