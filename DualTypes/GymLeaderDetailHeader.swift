//
//  GymLeaderDetailHeader.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailHeader: FlexibleCollectionCell {
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var elementName: UILabel!
    
    func configureCell(_ elementTypes: [ElementType]){
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let singleElement = elementTypes.first, elementTypes.count == 1 {
            circularView.backgroundColor = Colors.colorForElement(singleElement)
            elementName.textColor = Colors.textColorForElement(singleElement)
        } else if let firstElement = elementTypes.first,
            let lastElement = elementTypes.last
            , elementTypes.count == 2 {
            UIView.animate(withDuration: 2, delay: 0.0, options:[UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
                self.circularView.backgroundColor = Colors.colorForElement(firstElement)
                self.circularView.backgroundColor = Colors.colorForElement(lastElement)
            }, completion: nil)
        }
        let elementString = elementTypes.map {
            return NSLocalizedString($0.rawValue, comment: "")
        }.joined(separator: " / ")
        elementName?.text = elementString
    }
    
}
