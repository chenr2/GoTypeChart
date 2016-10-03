//
//  CounterOption.swift
//  DualTypes
//
//  Created by Robert Chen on 9/24/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class CounterOption: FlexibleCollectionCell {
    
    @IBOutlet weak var victimName: UILabel!
    @IBOutlet weak var averageDamage: UILabel!
    
    var averageMon: AverageMon? = nil
    
    func configureCell(_ averageMon: AverageMon){
        self.averageMon = averageMon
        victimName?.text = NSLocalizedString(averageMon.opponent.species.rawValue, comment: "")
        averageDamage?.text = String(format: "%.1f", (-1 * averageMon.average))
    }
    
}
