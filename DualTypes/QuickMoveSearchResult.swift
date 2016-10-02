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
    
    func configureCell(_ quickMove: QuickMove){
        self.quickMove = quickMove
        moveName?.text = NSLocalizedString(quickMove.quickAttack.rawValue, comment: "")
        let element = quickMove.element
        elementName?.text = NSLocalizedString(element.rawValue, comment: "") 
        elementView?.backgroundColor = Colors.colorForElement(element)
    }
}
