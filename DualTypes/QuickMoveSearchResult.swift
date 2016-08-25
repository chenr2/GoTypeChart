//
//  QuickMoveSearchResult.swift
//  DualTypes
//
//  Created by Robert Chen on 8/24/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class QuickMoveSearchResult: UITableViewCell {
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementView: UIView!
    
    var quickMove: QuickMove? = nil
    
    func configureCell(quickMove: QuickMove){
        self.quickMove = quickMove
        moveName?.text = quickMove.quickAttack.rawValue
        let element = quickMove.element
        elementName?.text = element.rawValue
        elementView?.backgroundColor = Colors.colorForElement(element)
    }
}
