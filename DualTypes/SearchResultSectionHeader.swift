//
//  SearchResultSectionHeader.swift
//  DualTypes
//
//  Created by Robert Chen on 8/14/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchResultSectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    func configureCell(_ sectionHeaderText: String){
        sectionTitle?.text = sectionHeaderText
    }
    
}
