//
//  SearchOverlayTable.swift
//  DualTypes
//
//  Created by Robert Chen on 8/19/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchOverlayTable: UITableViewController {
    var searchResultsSet: [Pokemon] = []
    var quickMoveSet: [QuickMove] = []
    var specialMoveSet: [SpecialMove] = []
    var modifySearchTextDelegate: ModifySearchTextDelegate? = nil
    
    func resetSearchResults(){
        searchResultsSet = PokemonCollections.allPokemon()
        quickMoveSet = QuickAttack.allValues.map { quickAttack in
            return QuickMove.moveForQuickAttack(quickAttack)
        }
    }
        
    override func viewDidLoad() {
        resetSearchResults()
    }
}

extension SearchOverlayTable {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return searchResultsSet.count
        case 1:
            return quickMoveSet.count
        default:
            return specialMoveSet.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(PokemonSearchTableResult)) as! PokemonSearchTableResult
            let selectedPokemon = searchResultsSet[indexPath.row]
            cell.configureCell(selectedPokemon)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(QuickMoveSearchResult)) as! QuickMoveSearchResult
            let selectedMove = quickMoveSet[indexPath.row]
            cell.configureCell(selectedMove)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(SpecialMoveSearchResult)) as! SpecialMoveSearchResult
            let selectedMove = specialMoveSet[indexPath.row]
            cell.configureCell(selectedMove)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.section {
        case 0:
            let selectedPokemon = searchResultsSet[indexPath.row]
            modifySearchTextDelegate?.tappedPokemon(selectedPokemon)
        default:
            break 
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return NSLocalizedString("Pokemon", comment: "")
        case 1:
            return NSLocalizedString("QUICK_MOVES", comment: "")
        default:
            return NSLocalizedString("SPECIAL_MOVES", comment: "")
        }
    }
    
}

extension SearchOverlayTable : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        view.hidden = false
        if let searchText = searchController.searchBar.text where !searchText.isEmpty {
            // trim beginning and end for whitespace.
            // then separate each search text word into its own search query
            let searchQueries: [String] = searchText
                .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                .componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                .filter {
                    return !$0.isEmpty
            }
            searchResultsSet = PokemonCollections.allPokemon().filter { pokemon in
                // what to include in the "search index"
                let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
                let pokemonIndex = "\(pokemon.pokedex)"
                let whatToSearchOnArray = [pokemonName, pokemonIndex]
                let descriptionText = whatToSearchOnArray.joinWithSeparator(" ")
                // all queries must pass. e.g. "bug flying" both words must hit.
                var response = true
                for query in searchQueries {
                    if !descriptionText.lowercaseString.containsString(query.lowercaseString) {
                        response = false
                    }
                }
                return response
            }
            quickMoveSet = QuickAttack.allValues.map { quickAttack in
                return QuickMove.moveForQuickAttack(quickAttack)
            }.filter { quickMove in
                var response = false
                for query in searchQueries {
                    if NSLocalizedString(quickMove.quickAttack.rawValue, comment: "").lowercaseString.containsString(query.lowercaseString) {
                        response = true
                    }
                }
                return response
            }
            specialMoveSet = SpecialAttack.allValues.map { specialMove in
                return SpecialMove.moveForSpecialAttack(specialMove)
            }.filter { specialMove in
                var response = false
                for query in searchQueries {
                    if NSLocalizedString(specialMove.specialAttack.rawValue, comment: "").lowercaseString.containsString(query.lowercaseString) {
                        response = true
                    }
                }
                return response
            }
            tableView?.reloadData()
        }
    }
}
