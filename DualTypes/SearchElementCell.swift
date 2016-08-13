//
//  SearchElementCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/12/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchElementCell: UICollectionViewCell {
    
    @IBOutlet weak var elementName: UILabel!
    
    var elementType: ElementType? = nil
    
    override func layoutSubviews() {
        if let elementType = elementType {
            elementName?.text = elementType.rawValue
            backgroundColor = Colors.colorForElement(elementType)
        }
    }
}
