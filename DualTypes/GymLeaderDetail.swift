//
//  GymLeaderDetail.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetail: UITableViewController {
    
    var pokemon: Pokemon? = nil 

}

extension GymLeaderDetail {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        default:
            return 0
        }
    }
    
}

extension GymLeaderDetail {

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GymLeaderDetailHeader") as! GymLeaderDetailHeader
        cell.textLabel?.text = pokemon?.name
        let elementArray = pokemon?.defense.map {
            return $0.rawValue
        }
        let elementString = elementArray?.joinWithSeparator(" / ")
        if let elementString = elementString {
            cell.detailTextLabel?.text = "Type:  \(elementString)"            
        }
        return cell
    }

}