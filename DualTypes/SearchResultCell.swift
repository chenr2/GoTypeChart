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
    @IBOutlet weak var elementName: UILabel!
    
    var pokemon: Pokemon? = nil 
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
        elementName?.text = pokemon.type.map {
            $0.rawValue
        }.joinWithSeparator(" / ")
    }
    
}