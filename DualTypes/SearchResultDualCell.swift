//
//  SearchResultDualCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/15/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchResultDualCell: FlexibleCollectionCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var secondElementName: UILabel!
    @IBOutlet weak var firstElementView: UIView!
    @IBOutlet weak var secondElementView: UIView!
    
    var pokemon: Pokemon? = nil
    
    func configureCell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = NSLocalizedString(pokemon.species.rawValue, comment: "")
        if let firstElement = pokemon.type.first {
            elementName?.text = NSLocalizedString(firstElement.rawValue, comment: "")
            firstElementView?.backgroundColor = Colors.colorForElement(firstElement)
            elementName?.textColor = Colors.textColorForElement(firstElement)
        }
        if let lastElement = pokemon.type.last {
            secondElementName?.text = NSLocalizedString(lastElement.rawValue, comment: "")
            secondElementView?.backgroundColor = Colors.colorForElement(lastElement)
            secondElementName?.textColor = Colors.textColorForElement(lastElement)
        }
    }
    
}
