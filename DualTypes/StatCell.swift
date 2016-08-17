//
//  StatCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class StatCell: GridCell {
    
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    
    func configureCell(pokemon: Pokemon, sortType: SortType){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
        switch sortType {
        case .Attack:
            sortLabel.text = "\(pokemon.attack)"
        case .Defense:
            sortLabel.text = "\(pokemon.defense)"
        case .Stamina:
            sortLabel.text = "\(pokemon.stamina)"
        default:
            sortLabel.text = ""
        }
    }
}
