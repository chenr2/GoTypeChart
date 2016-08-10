//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

enum SortType {
    case attack, defense, stamina, index, alphabetical
}

class GymLeaders: UICollectionViewController {
    
    var searchBar = UISearchBar()
    
    var gymLeadersArray: [Pokemon] = []
    
    var sortType:SortType = .index
    
    @IBAction func sortAlphabetically(sender: AnyObject) {
        sortExistingArrayAlphabetically()
        sortType = .alphabetical
        reloadSectionZero()
    }
    
    @IBAction func sortByIndex(sender: AnyObject) {
        sortExistingArrayByIndex()
        sortType = .index
        reloadSectionZero()
    }
    
    @IBAction func showAllTypes(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders()
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlySTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders()
        sortType = .attack
        sortExistingArrayByAttack()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyATier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders()
        sortType = .defense
        sortExistingArrayByDefense()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyBTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders()
        sortType = .stamina
        sortExistingArrayByStamina()
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
    
    func sortExistingArrayByStamina(){
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.stamina > pokemonB.stamina
        }
    }
    
    func sortExistingArrayByDefense(){
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.defense > pokemonB.defense
        }
    }
    
    func sortExistingArrayByAttack(){
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.attack > pokemonB.attack
        }
    }
    
    func showTheBestMons(){
        gymLeadersArray = Pokemon.gymLeaders()
        sortExistingArrayByIndex()
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
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let cell = sender as? StatCell {
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
        switch sortType {
        case .attack, .defense, .stamina:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StatCell", forIndexPath: indexPath) as! StatCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderCell", forIndexPath: indexPath) as! GymLeaderCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        }
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
                let elementNames = pokemon.type.map {
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
