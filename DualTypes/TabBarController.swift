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
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var reverse = false
        if let fromVCIndex = viewControllers?.indexOf(fromVC),
            let toVCIndex = viewControllers?.indexOf(toVC) {
            reverse = fromVCIndex > toVCIndex
        }
        return TabSwitchAnimator(reverse: reverse)
    }
}
