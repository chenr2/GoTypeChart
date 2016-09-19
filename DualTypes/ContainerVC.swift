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
    func toggleActionButtonVisibility(visible: Bool)
}

class ContainerVC: UIViewController {

    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .Left)
        
        if let tbc = tabBarController as? TabBarController {
            MenuHelper.mapGestureStateToInteractor(
                sender.state,
                progress: progress,
                interactor: tbc.interactor){
                    self.tabBarController?.selectedIndex = 1
            }
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func openModalMenu(sender: AnyObject) {
        gymLeaders?.performSegueWithIdentifier("openMenuModal", sender: nil)
    }
    
    @IBOutlet weak var actionButtonContainer: UIView!
    
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
        actionButton.setTitle(NSLocalizedString(sortType.rawValue, comment: ""), forState: .Normal) 
    }
    func toggleActionButtonVisibility(visible: Bool){
        actionButtonContainer.hidden = !visible
    }
}
