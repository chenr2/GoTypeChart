//
//  SearchResultCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/13/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchResultCell: FlexibleCollectionCell {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementContainerView: UIView!
    
    var pokemon: Pokemon? = nil 
    
    func configureCell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = NSLocalizedString(pokemon.species.rawValue, comment: "")
        if let element = pokemon.type.first {
            elementName?.text = NSLocalizedString(element.rawValue, comment: "")
            elementContainerView.backgroundColor = Colors.colorForElement(element)
            elementName?.textColor = Colors.textColorForElement(element)
        }
    }
    
}
