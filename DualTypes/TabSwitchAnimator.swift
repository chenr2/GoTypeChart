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
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            else {
                return
        }
        
        let containerView = transitionContext.containerView()
        
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
        if reverse {
            toVC.view.center.x -= UIScreen.mainScreen().bounds.width
        } else {
            toVC.view.center.x += UIScreen.mainScreen().bounds.width
        }

        UIView.animateWithDuration(
            transitionDuration(transitionContext),
            animations: {
                if self.reverse {
                    fromVC.view.center.x += UIScreen.mainScreen().bounds.width
                } else {
                    fromVC.view.center.x -= UIScreen.mainScreen().bounds.width
                }
                toVC.view.center.x = UIScreen.mainScreen().bounds.width / 2
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        )
    }
}
