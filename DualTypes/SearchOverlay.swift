//
//  SearchOverlay.swift
//  DualTypes
//
//  Created by Robert Chen on 8/12/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchOverlay: UICollectionViewController {
    
    let allElements = ElementType.allValues.sort {
        $0.rawValue < $1.rawValue
    }
    
    var modifySearchTextDelegate: ModifySearchTextDelegate? = nil
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allElements.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
        cell.elementType = allElements[indexPath.row]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = allElements[indexPath.row]
        if let modifySearchTextDelegate = modifySearchTextDelegate {
            modifySearchTextDelegate.tappedElement(selectedItem)            
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
    }
}