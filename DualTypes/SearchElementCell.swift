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
    @IBOutlet weak var closeButton: UILabel!
    
    func configureCell(element: ElementType, isFilter: Bool){
        elementName?.text = element.rawValue
        backgroundColor = Colors.colorForElement(element)
        closeButton.hidden = !isFilter
    }
    
}
