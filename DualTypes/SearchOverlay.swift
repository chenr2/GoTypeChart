//
//  SearchOverlay.swift
//  DualTypes
//
//  Created by Robert Chen on 8/12/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchOverlay: UICollectionViewController {
    
    var modifySearchTextDelegate: ModifySearchTextDelegate? = nil
    
    var searchResultsSet: [Pokemon] = []
    
    var helperElements: [ElementType] = []
    
    var elementFilters: [ElementType] = []
    
    override func viewDidAppear(animated: Bool) {
        helperElements = ElementType.allValues
        elementFilters = []
        searchResultsSet = Pokemon.gymLeaders()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return helperElements.count
        default:
            return searchResultsSet.count
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
            cell.elementType = helperElements[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("searchResultCell", forIndexPath: indexPath) as! SearchResultCell
            cell.pokemon = searchResultsSet[indexPath.row]
            return cell
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            let selectedItem = helperElements[indexPath.row]
            if elementFilters.contains(selectedItem) {
                // already a filter, so remove it
                elementFilters = elementFilters.filter {
                    $0 != selectedItem
                }
            } else {
                // not a filter, so add it
                elementFilters.append(selectedItem)
            }
            if elementFilters.isEmpty {
                helperElements = ElementType.allValues
            } else if elementFilters.count == 1 {
                // there's only one element, if there's a count of 1.
                let singleElement = elementFilters.first!
                // should show other element if it exists.
                // start with all pokemon.
                let dualTypePokemonOfThatElement = Pokemon.gymLeaders().filter {
                    $0.type.contains(singleElement)
                }.filter {
                    // just those pokemon with 2 elements
                    $0.type.count == 2
                }
                var otherElements: [ElementType] = []
                for dualType in dualTypePokemonOfThatElement {
                    otherElements += dualType.type
                }
                helperElements = Array(Set(otherElements))
            } else {
                // show everything
                helperElements = elementFilters
            }

            searchResultsSet = Pokemon.gymLeaders().filter { pokemon in
                let pokemonType = Set(pokemon.type)
                let elementFilterTypes = Set(elementFilters)
                return elementFilterTypes.isSubsetOf(pokemonType)
            }
            
            print("helperElements: \(helperElements)")
            print("elementFilters: \(elementFilters)")
            
            self.collectionView?.reloadData()
        default:
            break
        }
    }
}

extension SearchOverlay: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellsPerRow:CGFloat = 3
        let height: CGFloat = 48
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        return CGSize(width: eachSide, height: height)
    }
    
}

extension SearchOverlay : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText.isEmpty {
                helperElements = ElementType.allValues
                searchResultsSet = Pokemon.gymLeaders()
            } else {
                helperElements = []
                searchResultsSet = Pokemon.gymLeaders().filter { pokemon in
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
            collectionView?.reloadData()
        }

    }
}