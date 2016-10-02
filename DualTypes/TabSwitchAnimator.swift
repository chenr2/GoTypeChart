//
//  TabSwitchAnimator.swift
//  DualTypes
//
//  Created by Robert Chen on 9/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class TabSwitchAnimator : NSObject {
    var reverse = false
    
    init(reverse: Bool = false){
        self.reverse = reverse
    }
}

extension TabSwitchAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
        if reverse {
            toVC.view.center.x -= UIScreen.main.bounds.width
        } else {
            toVC.view.center.x += UIScreen.main.bounds.width
        }

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                if self.reverse {
                    fromVC.view.center.x += UIScreen.main.bounds.width
                } else {
                    fromVC.view.center.x -= UIScreen.main.bounds.width
                }
                toVC.view.center.x = UIScreen.main.bounds.width / 2
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}
