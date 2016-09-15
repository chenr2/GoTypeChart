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
    
    func configureCell(elementTypes: [ElementType]){
        circularView.layer.cornerRadius = bounds.size.width / 2
        if let singleElement = elementTypes.first where elementTypes.count == 1 {
            circularView.backgroundColor = Colors.colorForElement(singleElement)
        } else if let firstElement = elementTypes.first,
            let lastElement = elementTypes.last
            where elementTypes.count == 2 {
            UIView.animateWithDuration(2, delay: 0.0, options:[UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: {
                self.circularView.backgroundColor = Colors.colorForElement(firstElement)
                self.circularView.backgroundColor = Colors.colorForElement(lastElement)
            }, completion: nil)
        }
        let elementString = elementTypes.map {
            return NSLocalizedString($0.rawValue, comment: "")
        }.joinWithSeparator(" / ")
        elementName?.text = elementString
    }
    
}
