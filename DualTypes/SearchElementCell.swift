//
//  SearchElementCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/12/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchElementCell: FlexibleCollectionCell {
    
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var closeButton: UILabel!
    @IBOutlet weak var closeButtonWidth: NSLayoutConstraint!
    
    func configureCell(_ element: ElementType, isFilter: Bool){
        elementName?.text = NSLocalizedString(element.rawValue, comment: "")
        elementName?.textColor = Colors.textColorForElement(element)
        backgroundColor = Colors.colorForElement(element)
        if isFilter {
            closeButtonWidth.constant = 13.5
            closeButton.isHidden = false
        } else {
            closeButtonWidth.constant = 0
            closeButton.isHidden = true
        }
    }
    
}
