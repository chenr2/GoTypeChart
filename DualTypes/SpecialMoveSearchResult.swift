//
//  SpecialMoveSearchResult.swift
//  DualTypes
//
//  Created by Robert Chen on 8/24/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SpecialMoveSearchResult: UITableViewCell {
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementView: UIView!
    
    var specialMove: SpecialMove? = nil
    
    func configureCell(specialMove: SpecialMove){
        self.specialMove = specialMove
        moveName?.text = NSLocalizedString(specialMove.specialAttack.rawValue, comment: "")
        let element = specialMove.element
        elementName?.text = NSLocalizedString(element.rawValue, comment: "") 
        elementView?.backgroundColor = Colors.colorForElement(element)
    }
}
