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
        collectionView?.reloadData()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return elementFilters.count
        case 1:
            return helperElements.count
        default:
            return searchResultsSet.count
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
            let element = elementFilters[indexPath.row]
            cell.configureCell(element, isFilter: true)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
            let element = helperElements[indexPath.row]
            cell.configureCell(element, isFilter: false)
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("searchResultCell", forIndexPath: indexPath) as! SearchResultCell
            cell.configureCell(searchResultsSet[indexPath.row])
            return cell
        }
    }
    
    func recalculateFilters(){
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
            var otherElementsSet = Set(otherElements)
            otherElementsSet.remove(singleElement)
            helperElements = Array(otherElementsSet)
        } else {
            // show everything
            helperElements = []
        }
        searchResultsSet = Pokemon.gymLeaders().filter { pokemon in
            let pokemonType = Set(pokemon.type)
            let elementFilterTypes = Set(elementFilters)
            return elementFilterTypes.isSubsetOf(pokemonType)
        }
        collectionView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            elementFilters.removeAtIndex(indexPath.row)
            recalculateFilters()
        case 1:
            let selectedItem = helperElements[indexPath.row]
            elementFilters.append(selectedItem)
            recalculateFilters()
        default:
            let selectedPokemon = searchResultsSet[indexPath.row]
            modifySearchTextDelegate?.tappedPokemon(selectedPokemon)
            break
        }
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "SearchResultSectionHeader", forIndexPath: indexPath) as! SearchResultSectionHeader
        switch indexPath.section {
        case 0:
            cell.sectionHeaderText = "Filtering on these types".uppercaseString
        case 1:
            cell.sectionHeaderText = "Choose from these types".uppercaseString
        default:
            cell.sectionHeaderText = "Search filter results".uppercaseString
        }
        return cell
    }
}

extension SearchOverlay: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellsPerRow:CGFloat = 3
        let height: CGFloat = 48
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch indexPath.section {
        case 0, 1:
            return CGSize(width: eachSide, height: height)
        default:
            return CGSize(width: eachSide, height: eachSide)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            if elementFilters.isEmpty {
                return CGSizeZero
            }
        case 1:
            if helperElements.isEmpty {
                return CGSizeZero
            }
        default:
            break
        }
        return CGSize(width: 0, height: 40)
    }
}

extension SearchOverlay : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        view.hidden = false 
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