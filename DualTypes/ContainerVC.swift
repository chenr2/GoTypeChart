//
//  ContainerVC.swift
//  DualTypes
//
//  Created by Robert Chen on 8/15/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

protocol ContainerEventRelay {
    func detectActionMenuChange(_ sortType: SortType)
    func toggleActionButtonVisibility(_ visible: Bool)
}

class ContainerVC: UIViewController {

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .left)
        
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
    
    @IBAction func openModalMenu(_ sender: AnyObject) {
        gymLeaders?.performSegue(withIdentifier: "openMenuModal", sender: nil)
    }
    
    @IBOutlet weak var actionButtonContainer: UIView!
    
    var gymLeaders: GymLeaders? = nil
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
            let main = nav.viewControllers.first as? GymLeaders {
            gymLeaders = main
            gymLeaders?.containerEventRelay = self
        }
    }
    
    override func viewDidLoad() {
        actionButton.layer.borderColor = UIColor.white.cgColor
    }
}

extension ContainerVC: ContainerEventRelay {
    func detectActionMenuChange(_ sortType: SortType){
        actionButton.setTitle(NSLocalizedString(sortType.rawValue, comment: ""), for: UIControlState()) 
    }
    func toggleActionButtonVisibility(_ visible: Bool){
        actionButtonContainer.isHidden = !visible
    }
}
