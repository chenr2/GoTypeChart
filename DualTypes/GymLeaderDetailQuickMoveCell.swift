//
//  GymLeaderDetailQuickMoveCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailQuickMoveCell: FlexibleCollectionCell {
    
    @IBOutlet weak var dpsLabel: UILabel!
    @IBOutlet weak var selectionBar: UIView!
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementType: UILabel!
    @IBOutlet weak var statArc: StatRing!
    @IBOutlet weak var elementBubble: UIView!
    @IBOutlet weak var dpsStat: UILabel!
    
    var dpsLabelText = ""
    
    override func layoutSubviews() {
        dpsLabel.text = dpsLabelText
    }
    
    func changeSelection(_ cellSelected: Bool, element: ElementType?){
        let blue = UIColor(colorLiteralRed: 0.290, green: 0.565, blue: 0.886, alpha: 1)
        selectionBar.backgroundColor = cellSelected ? blue : UIColor.white
        if let element = element , cellSelected {
            let elementColor = Colors.colorForElement(element)
            statArc.fillColor = elementColor.withAlphaComponent(0.1)
        } else {
            statArc.fillColor = UIColor.white
        }
    }
    
    func attributedStabBonus(_ dps: CGFloat, elementColor: UIColor, stab: Bool) -> NSMutableAttributedString {
        let mainAttributes = [
            NSForegroundColorAttributeName : UIColor.darkGray
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
            mainAttributedString.append(bonusAttributedString)
        }
        return mainAttributedString
    }
    
    func dpsWithStab(_ dps: CGFloat, stab: Bool) -> CGFloat {
        let multiplier: CGFloat = stab ? 1.25 : 1
        return dps * multiplier
    }
    
    func configureCell(_ quickAttack: QuickAttack, specialAttack: SpecialAttack, pokemon: Pokemon, cellSelected: Bool) -> CGFloat {
        let move = QuickMove.moveForQuickAttack(quickAttack)
        let element = move.element
        changeSelection(cellSelected, element: element)
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = NSLocalizedString(quickAttack.rawValue, comment: "")
        elementType?.text = NSLocalizedString(element.rawValue, comment: "")
        let specialMove = SpecialMove.moveForSpecialAttack(specialAttack)
        let qmDoT: CGFloat = QuickMove.qmDoTBasedOnCm(qmDPS: move.dps, bar: specialMove.bar, cmDuration: specialMove.duration, quickmoveEPS: move.eps)
        statArc.percent = move.quickMovePercentage(CGFloat(pokemon.attack), stab: stabFlag)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        dpsStat?.attributedText = attributedStabBonus(qmDoT, elementColor: elementColor, stab: stabFlag)
        dpsLabelText = "DoT"
        return dpsWithStab(qmDoT, stab: stabFlag)
    }
    
    func configureCellSpecial(_ specialAttack: SpecialAttack, quickAttack: QuickAttack, pokemon: Pokemon, cellSelected: Bool) -> CGFloat {
        let specialMove = SpecialMove.moveForSpecialAttack(specialAttack)
        let element = specialMove.element
        changeSelection(cellSelected, element: element)
        let stabFlag = pokemon.type.contains(element)
        moveName?.text = NSLocalizedString(specialAttack.rawValue, comment: "")
        elementType?.text = NSLocalizedString(element.rawValue, comment: "")
        let quickMove = QuickMove.moveForQuickAttack(quickAttack)
        let dps: CGFloat = SpecialMove.cmDPSBasedOnQm(bar: specialMove.bar, duration: specialMove.duration, power: specialMove.power, quickmoveEPS: quickMove.eps)
        statArc.percent = specialMove.specialMovePercentage(CGFloat(pokemon.attack), stab: stabFlag, dps: dps)
        let elementColor = Colors.colorForElement(element)
        elementBubble.backgroundColor = elementColor
        elementType.textColor = Colors.textColorForElement(element)
        dpsStat?.attributedText = attributedStabBonus(dps, elementColor: elementColor, stab: stabFlag)
        dpsLabelText = "DoT"
        return dpsWithStab(dps, stab: stabFlag)
    }

}
