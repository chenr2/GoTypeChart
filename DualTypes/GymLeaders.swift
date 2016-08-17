//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

protocol ModifySearchTextDelegate {
    func tappedPokemon(pokemon: Pokemon)
}

protocol ChangeSortType {
    func setSortType(sortType: SortType)
    func activateSearch()
}

enum SortType: String {
    case Attack, Defense, Stamina, Index, Alphabetical = "AZ"
}

class GymLeaders: UICollectionViewController {
    
    var gymLeadersArray: [Pokemon] = []
    
    var containerEventRelay: ContainerEventRelay? = nil
    
    var sortType:SortType = .Attack {
        didSet {
            containerEventRelay?.detectActionMenuChange(sortType)
            resetMonsSortedBySelectedType()
            reloadSectionZero()
        }
    }
    
    var resultSearchController:UISearchController? = nil
    
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
        case .Index:
            sortExistingArrayByIndex()
        case .Alphabetical:
            sortExistingArrayAlphabetically()
        case .Attack:
            sortExistingArrayByAttack()
        case .Defense:
            sortExistingArrayByDefense()
        case .Stamina:
            sortExistingArrayByStamina()
        }
    }
    
    override func viewDidLoad() {
        resetMonsSortedBySelectedType()
        
        let searchOverlayCollection = storyboard!.instantiateViewControllerWithIdentifier("SearchOverlay") as! SearchOverlay
        searchOverlayCollection.modifySearchTextDelegate = self
        resultSearchController = UISearchController(searchResultsController: searchOverlayCollection)
        resultSearchController?.searchResultsUpdater = searchOverlayCollection
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Enter a name, or filter by type."
        searchBar.delegate = self
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        resultSearchController?.delegate = self
        resultSearchController?.searchBar.enablesReturnKeyAutomatically = false
        resultSearchController?.searchBar.autocapitalizationType = .None
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let pokemon = sender as? Pokemon
            where segue.identifier == "pushPokemonDetail" {
            destination.pokemon = pokemon
        }
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let cell = sender as? GridCell {
            destination.pokemon = cell.pokemon
        }
        if let destination = segue.destinationViewController as? MenuModal {
            destination.changeSortType = self 
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellPadding:CGFloat = 5
        let cellsPerRow:CGFloat = 3
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        switch sortType {
        case .Index, .Alphabetical:
            return CGSize(width: eachSide, height:70)
        default:
            return CGSize(width: eachSide, height:eachSide)
        }
    }
    
}

extension GymLeaders {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gymLeadersArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch sortType {
        case .Attack, .Defense, .Stamina:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StatCell", forIndexPath: indexPath) as! StatCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        case .Alphabetical:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(AlphabeticalCell), forIndexPath: indexPath) as! AlphabeticalCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        case .Index:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderCell), forIndexPath: indexPath) as! GymLeaderCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        }
    }
}

extension GymLeaders: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchResults = resultSearchController?.searchResultsController as? SearchOverlay {
            searchResults.resetSearch()
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // handles clearing of search bar.
        if let searchResults = resultSearchController?.searchResultsController as? SearchOverlay where searchText.isEmpty {
            searchResults.resetSearch()
        }
    }
}

extension GymLeaders: UISearchControllerDelegate {
    // search bar selection shows elements
    func didPresentSearchController(searchController: UISearchController) {
        if let searchResultsController = searchController.searchResultsController as? SearchOverlay {
            searchResultsController.view.hidden = false
        }
    }
}

extension GymLeaders: ModifySearchTextDelegate {
    func tappedPokemon(pokemon: Pokemon){
        performSegueWithIdentifier("pushPokemonDetail", sender: pokemon)
    }
}

extension GymLeaders: ChangeSortType {
    func setSortType(sortType: SortType){
        self.sortType = sortType
    }
    
    func activateSearch(){
        resultSearchController?.searchBar.becomeFirstResponder()
    }
}