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
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
        if let element = pokemon.type.first {
            elementName?.text = element.rawValue
            elementContainerView.backgroundColor = Colors.colorForElement(element)
            elementName?.textColor = Colors.textColorForElement(element)
        }
    }
    
}