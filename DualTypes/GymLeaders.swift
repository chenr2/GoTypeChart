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
    
    let segmentedControl = UISegmentedControl(items: ["Index", "AZ", "Attack", "Defense", "Stamina"])
    
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
    
    func resetMonsSortedBySelectedType(){
        gymLeadersArray = Pokemon.gymLeaders()
        switch sortType {
        case .index:
            sortExistingArrayByIndex()
        case .alphabetical:
            sortExistingArrayAlphabetically()
        case .attack:
            sortExistingArrayByAttack()
        case .defense:
            sortExistingArrayByDefense()
        case .stamina:
            sortExistingArrayByStamina()
        }
    }
    
    func segmentedControlTapped(segment: UISegmentedControl){
        searchBar.text = ""
        switch segment.selectedSegmentIndex {
        case 0: // index
            sortType = .index
        case 1: // AZ
            sortType = .alphabetical
        case 2: // attack
            sortType = .attack
        case 3: // defense
            sortType = .defense
        case 4: // stamina
            sortType = .stamina
        default:
            break
        }
        resetMonsSortedBySelectedType()
        reloadSectionZero()
    }
    
    override func viewDidLoad() {
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Pokemon name or type"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        resetMonsSortedBySelectedType()
        
        segmentedControl.addTarget(self, action: #selector(GymLeaders.segmentedControlTapped(_:)), forControlEvents: .ValueChanged)
        segmentedControl.selectedSegmentIndex = 0
        let segmentedControlButtonItem = UIBarButtonItem(customView: segmentedControl)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        setToolbarItems([flexibleSpace, segmentedControlButtonItem, flexibleSpace], animated: false)
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
            resetMonsSortedBySelectedType()
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
