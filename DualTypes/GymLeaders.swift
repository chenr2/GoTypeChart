//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

protocol ModifySearchTextDelegate {
    func tappedElement(element: ElementType)
    func tappedPokemon(pokemon: Pokemon)
}

enum SortType {
    case attack, defense, stamina, index, alphabetical
}

class GymLeaders: UICollectionViewController {
    
    var gymLeadersArray: [Pokemon] = []
    
    var sortType:SortType = .attack
    
    let segmentedControl = UISegmentedControl(items: ["Index", "AZ", "Attack", "Defense", "Stamina"])
    
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
        resetMonsSortedBySelectedType()
        
        segmentedControl.addTarget(self, action: #selector(GymLeaders.segmentedControlTapped(_:)), forControlEvents: .ValueChanged)
        segmentedControl.selectedSegmentIndex = 2
        let segmentedControlButtonItem = UIBarButtonItem(customView: segmentedControl)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        setToolbarItems([flexibleSpace, segmentedControlButtonItem, flexibleSpace], animated: false)
        
        let searchOverlayCollection = storyboard!.instantiateViewControllerWithIdentifier("SearchOverlay") as! SearchOverlay
        searchOverlayCollection.modifySearchTextDelegate = self
        resultSearchController = UISearchController(searchResultsController: searchOverlayCollection)
        resultSearchController?.searchResultsUpdater = searchOverlayCollection
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Pokemon name or type"
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
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text {
            if searchText.isEmpty {
                resetMonsSortedBySelectedType()
            } else {
                gymLeadersArray = Pokemon.gymLeaders().filter { pokemon in
                    // what to include in the "search index"
                    let pokemonName = pokemon.name.lowercaseString
                    let pokemonIndex = "\(pokemon.pokedex)"
                    let elementNames = pokemon.type.map {
                        $0.rawValue.lowercaseString
                    }
                    var whatToSearchOnArray = [pokemonName, pokemonIndex]
                    whatToSearchOnArray += elementNames
                    let descriptionText = whatToSearchOnArray.joinWithSeparator(" ")
                    // trim beginning and end for whitespace.
                    // then separate each search text word into its own search query
                    let searchQueries: [String] = searchText
                        .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                        .componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                        .filter {
                            return !$0.isEmpty
                        }
                    // all queries must pass. e.g. "bug flying" both words must hit.
                    var response = true
                    for query in searchQueries {
                        if !descriptionText.containsString(query) {
                            response = false
                        }
                    }
                    return response
                }
            }
            reloadSectionZero()
        }
        resultSearchController?.active = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
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
    func tappedElement(element: ElementType){
        if let searchBarText = resultSearchController?.searchBar.text {
            resultSearchController?.searchBar.text = "\(searchBarText) \(element.rawValue.lowercaseString) "
        }
    }
    
    func tappedPokemon(pokemon: Pokemon){
        performSegueWithIdentifier("pushPokemonDetail", sender: pokemon)
    }

}