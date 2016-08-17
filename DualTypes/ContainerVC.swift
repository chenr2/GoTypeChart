//
//  ContainerVC.swift
//  DualTypes
//
//  Created by Robert Chen on 8/15/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

protocol ContainerEventRelay {
    func detectActionMenuChange(sortType: SortType)
}

class ContainerVC: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func openModalMenu(sender: AnyObject) {
        gymLeaders?.performSegueWithIdentifier("openMenuModal", sender: nil)
    }
    
    var gymLeaders: GymLeaders? = nil
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let nav = segue.destinationViewController as? UINavigationController,
            let main = nav.viewControllers.first as? GymLeaders {
            gymLeaders = main
            gymLeaders?.containerEventRelay = self
        }
    }
    
    override func viewDidLoad() {
        actionButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
}

extension ContainerVC: ContainerEventRelay {
    func detectActionMenuChange(sortType: SortType){
        actionButton.setTitle(sortType.rawValue, forState: .Normal)
    }
}
