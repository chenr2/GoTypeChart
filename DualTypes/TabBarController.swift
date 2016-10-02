//
//  TabBarController.swift
//  DualTypes
//
//  Created by Robert Chen on 9/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let interactor = Interactor()
    override func viewDidLoad() {
        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var reverse = false
        if let fromVCIndex = viewControllers?.index(of: fromVC),
            let toVCIndex = viewControllers?.index(of: toVC) {
            reverse = fromVCIndex > toVCIndex
        }
        return TabSwitchAnimator(reverse: reverse)
    }
}
