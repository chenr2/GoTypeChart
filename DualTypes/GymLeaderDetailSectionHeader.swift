//
//  GymLeaderDetailSectionHeader.swift
//  DualTypes
//
//  Created by Robert Chen on 8/5/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetailSectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    var sectionHeaderText: String = ""
    
    override func layoutSubviews() {
        sectionTitle?.text = sectionHeaderText
    }
    
}
