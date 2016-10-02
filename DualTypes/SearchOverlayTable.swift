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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return searchResultsSet.count
        case 1:
            return quickMoveSet.count
        default:
            return specialMoveSet.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonSearchTableResult") as! PokemonSearchTableResult
            let selectedPokemon = searchResultsSet[(indexPath as NSIndexPath).row]
            cell.configureCell(selectedPokemon)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuickMoveSearchResult") as! QuickMoveSearchResult
            let selectedMove = quickMoveSet[(indexPath as NSIndexPath).row]
            cell.configureCell(selectedMove)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialMoveSearchResult") as! SpecialMoveSearchResult
            let selectedMove = specialMoveSet[(indexPath as NSIndexPath).row]
            cell.configureCell(selectedMove)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath as NSIndexPath).section {
        case 0:
            let selectedPokemon = searchResultsSet[(indexPath as NSIndexPath).row]
            modifySearchTextDelegate?.tappedPokemon(selectedPokemon)
        default:
            break 
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
    func updateSearchResults(for searchController: UISearchController) {
        view.isHidden = false
        if let searchText = searchController.searchBar.text , !searchText.isEmpty {
            // trim beginning and end for whitespace.
            // then separate each search text word into its own search query
            let searchQueries: [String] = searchText
                .trimmingCharacters(in: CharacterSet.whitespaces)
                .components(separatedBy: CharacterSet.whitespaces)
                .filter {
                    return !$0.isEmpty
            }
            searchResultsSet = PokemonCollections.allPokemon().filter { pokemon in
                // what to include in the "search index"
                let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
                let pokemonIndex = "\(pokemon.pokedex)"
                let whatToSearchOnArray = [pokemonName, pokemonIndex]
                let descriptionText = whatToSearchOnArray.joined(separator: " ")
                // all queries must pass. e.g. "bug flying" both words must hit.
                var response = true
                for query in searchQueries {
                    if !descriptionText.lowercased().contains(query.lowercased()) {
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
                    if NSLocalizedString(quickMove.quickAttack.rawValue, comment: "").lowercased().contains(query.lowercased()) {
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
                    if NSLocalizedString(specialMove.specialAttack.rawValue, comment: "").lowercased().contains(query.lowercased()) {
                        response = true
                    }
                }
                return response
            }
            tableView?.reloadData()
        }
    }
}
