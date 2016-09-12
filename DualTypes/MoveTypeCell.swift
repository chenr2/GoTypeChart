//
//  MoveTypeCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/23/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class MoveTypeCell: GridCell {
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var secondElementName: UILabel!
    @IBOutlet weak var firstElementView: UIView!
    @IBOutlet weak var secondElementView: UIView!

    @IBOutlet weak var quickMove1: UIView!
    @IBOutlet weak var quickMove2: UIView!
    
    @IBOutlet weak var chargeMove1: UIView!
    @IBOutlet weak var chargeMove2: UIView!
    @IBOutlet weak var chargeMove3: UIView!
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = NSLocalizedString(pokemon.name, comment: "")
        quickMove1.backgroundColor = UIColor.clearColor()
        quickMove2.backgroundColor = UIColor.clearColor()
        chargeMove1.backgroundColor = UIColor.clearColor()
        chargeMove2.backgroundColor = UIColor.clearColor()
        chargeMove3.backgroundColor = UIColor.clearColor()
        elementName?.text = ""
        firstElementView?.backgroundColor = UIColor.clearColor()
        elementName?.textColor = UIColor.clearColor()
        secondElementName?.text = ""
        secondElementView?.backgroundColor = UIColor.clearColor()
        secondElementName?.textColor = UIColor.clearColor()

        if let firstElement = pokemon.type.first {
            elementName?.text = NSLocalizedString(firstElement.rawValue, comment: "")
            firstElementView?.backgroundColor = Colors.colorForElement(firstElement)
            elementName?.textColor = Colors.textColorForElement(firstElement)
        }
        if pokemon.type.count == 2 {
            if let lastElement = pokemon.type.last {
                secondElementName?.text = NSLocalizedString(lastElement.rawValue, comment: "")
                secondElementView?.backgroundColor = Colors.colorForElement(lastElement)
                secondElementName?.textColor = Colors.textColorForElement(lastElement)
            }
        }
        let quickAttacks: [QuickAttack] = pokemon.quickAttacks.sort { attackA, attackB in
            let baseAttack = CGFloat(pokemon.attack)
            let moveA = QuickMove.moveForQuickAttack(attackA)
            let stabA = pokemon.type.contains(moveA.element)
            let statA = moveA.quickMovePercentage(baseAttack, stab: stabA)
            let moveB = QuickMove.moveForQuickAttack(attackB)
            let stabB = pokemon.type.contains(moveB.element)
            let statB = moveB.quickMovePercentage(baseAttack, stab: stabB)
            return statA > statB
        }
        let specialAttacks: [SpecialAttack] = pokemon.specialAttacks.sort { attackA, attackB in
            let baseAttack = CGFloat(pokemon.attack)
            let moveA = SpecialMove.moveForSpecialAttack(attackA)
            let stabA = pokemon.type.contains(moveA.element)
            let statA = moveA.specialMovePercentage(baseAttack, stab: stabA)
            let moveB = SpecialMove.moveForSpecialAttack(attackB)
            let stabB = pokemon.type.contains(moveB.element)
            let statB = moveB.specialMovePercentage(baseAttack, stab: stabB)
            return statA > statB
        }
        if let firstQuickAttack = quickAttacks.first {
            let element = QuickMove.moveForQuickAttack(firstQuickAttack).element
            quickMove1.backgroundColor = Colors.colorForElement(element)
        }
        if let lastQuickAttack = quickAttacks.last where quickAttacks.count == 2 {
            let element = QuickMove.moveForQuickAttack(lastQuickAttack).element
            quickMove2.backgroundColor = Colors.colorForElement(element)
        }
        if let firstSpecialAttack = specialAttacks.first {
            let element = SpecialMove.moveForSpecialAttack(firstSpecialAttack).element
            chargeMove1.backgroundColor = Colors.colorForElement(element)
        }
        if specialAttacks.count > 2 {
            let secondSpecialAttack = specialAttacks[1]
            let element = SpecialMove.moveForSpecialAttack(secondSpecialAttack).element
            chargeMove2.backgroundColor = Colors.colorForElement(element)
        }

        if specialAttacks.count > 2 {
            let thirdSpecialAttack = specialAttacks[2]
            let element = SpecialMove.moveForSpecialAttack(thirdSpecialAttack).element
            chargeMove3.backgroundColor = Colors.colorForElement(element)
        }
        
    }
}
