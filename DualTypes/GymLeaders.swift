//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaders: UICollectionViewController {
    
    var searchBar = UISearchBar()
    
    var gymLeadersArray: [Pokemon] = []
    
    @IBAction func sortAlphabetically(sender: AnyObject) {
        sortExistingArrayAlphabetically()
        reloadSectionZero()
    }
    
    @IBAction func sortByIndex(sender: AnyObject) {
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showAllTypes(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders()
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlySTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.S
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyATier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.A
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyBTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.B
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    func reloadSectionZero(){
        let sectionZero = NSIndexSet(index: 0)
        collectionView?.reloadSections(sectionZero)
    }
    
    func sortExistingArrayAlphabetically() {
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.name.lowercaseString < pokemonB.name.lowercaseString
        }
    }
    
    func sortExistingArrayByIndex(){
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.pokedex < pokemonB.pokedex
        }
    }
    
    func showTheBestMons(){
        gymLeadersArray = Pokemon.gymLeaders()
        sortExistingArrayAlphabetically()
    }
    
    override func viewDidLoad() {
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Pokemon name or type"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        showTheBestMons()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let cell = sender as? GymLeaderCell {
            destination.pokemon = cell.pokemon
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellPadding:CGFloat = 5
        let cellsPerRow:CGFloat = 3
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        return CGSize(width: eachSide, height:eachSide)
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationController?.setToolbarHidden(true, animated: true)
    }
}

extension GymLeaders {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gymLeadersArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderCell", forIndexPath: indexPath) as! GymLeaderCell
        cell.pokemon = gymLeadersArray[indexPath.row]
        return cell
    }
}

extension GymLeaders: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            showTheBestMons()
        } else {
            gymLeadersArray = Pokemon.gymLeaders().filter { pokemon in
                // filter by names
                if pokemon.name.lowercaseString.containsString(searchText.lowercaseString) {
                    return true
                }
                // filter by elements
                let elementNames = pokemon.defense.map {
                    $0.rawValue
                    }.joinWithSeparator(" ")
                if elementNames.lowercaseString.containsString(searchText.lowercaseString) {
                    return true
                }
                // filter by number
                if "\(pokemon.pokedex)".containsString(searchText) {
                    return true
                }
                return false
            }
        }
        reloadSectionZero()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
