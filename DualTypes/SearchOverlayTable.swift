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
    var moveSet: [QuickMove] = []
    var modifySearchTextDelegate: ModifySearchTextDelegate? = nil
}

extension SearchOverlayTable {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return searchResultsSet.count
        default:
            return moveSet.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("pokemonCell")!
            cell.textLabel?.text = searchResultsSet[indexPath.row].name
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("moveCell")!
            cell.textLabel?.text = moveSet[indexPath.row].quickAttack.rawValue
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedPokemon = searchResultsSet[indexPath.row]
        modifySearchTextDelegate?.tappedPokemon(selectedPokemon)
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
            searchResultsSet = Pokemon.gymLeaders().filter { pokemon in
                // what to include in the "search index"
                let pokemonName = pokemon.name.lowercaseString
                let pokemonIndex = "\(pokemon.pokedex)"
                let whatToSearchOnArray = [pokemonName, pokemonIndex]
                let descriptionText = whatToSearchOnArray.joinWithSeparator(" ")
                // all queries must pass. e.g. "bug flying" both words must hit.
                var response = true
                for query in searchQueries {
                    if !descriptionText.containsString(query) {
                        response = false
                    }
                }
                return response
            }
            tableView?.reloadData()
        }
    }
}