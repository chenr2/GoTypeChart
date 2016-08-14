//
//  SearchResultCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/13/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemon: Pokemon? = nil 
    
    override func layoutSubviews() {
        if let pokemon = pokemon {
            pokemonName?.text = pokemon.name
        }
    }
}