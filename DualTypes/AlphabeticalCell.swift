//
//  AlphabeticalCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/16/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class AlphabeticalCell: GridCell {
    
    @IBOutlet var pokemonName: UILabel!
        
    func configureCell(pokemon: Pokemon, sortType: SortType){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
        backgroundColor = Colors.purple
    }
}
