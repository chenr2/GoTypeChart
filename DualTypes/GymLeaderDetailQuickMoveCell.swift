//
//  GymLeaderDetailQuickMoveCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailQuickMoveCell: FlexibleCollectionCell {
    
    @IBOutlet weak var selectionBar: UIView!
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statArc: StatRing!
    @IBOutlet weak var elementBubble: UIView!
    @IBOutlet weak var dpsStat: UILabel!
    
    func changeSelection(cellSelected: Bool){
        let blue = UIColor(colorLiteralRed: 0.290, green: 0.565, blue: 0.886, alpha: 1)
        selectionBar.backgroundColor = cellSelected ? blue : UIColor.whiteColor()
    }
    
    func attributedStabBonus(dps: CGFloat, elementColor: UIColor, stab: Bool) -> NSMutableAttributedString {
        let mainAttributes = [
            NSForegroundColorAttributeName : UIColor.darkGrayColor()
        ]
        let dpsNumberString = String(format: "%.1f", dps)
        let mainString = dpsNumberString
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
    
    func configureCell(quickAttack: QuickAttack, pokemon: Pokemon, cellSelected: Bool){
        changeSelection(cellSelected)
        let move = QuickMove.moveForQuickAttack(quickAttack)
        let element = move.element
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = NSLocalizedString(quickAttack.rawValue, comment: "")
        elementType?.text = NSLocalizedString(element.rawValue, comment: "")
        statArc.percent = move.quickMovePercentage(CGFloat(pokemon.attack), stab: stabFlag)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        let dps = move.dps
        dpsStat?.attributedText = attributedStabBonus(dps, elementColor: elementColor, stab: stabFlag)
    }
    
    func configureCellSpecial(specialAttack: SpecialAttack, pokemon: Pokemon, cellSelected: Bool){
        changeSelection(cellSelected)
        let move = SpecialMove.moveForSpecialAttack(specialAttack)
        let element = move.element
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = NSLocalizedString(specialAttack.rawValue, comment: "")
        elementType?.text = NSLocalizedString(element.rawValue, comment: "")
        statArc.percent = move.specialMovePercentage(CGFloat(pokemon.attack), stab: stabFlag)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        let dps = move.dps
        dpsStat?.attributedText = attributedStabBonus(dps, elementColor: elementColor, stab: stabFlag)
    }

}
