

import Foundation
import UIKit

class PushAnimator:NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(UINavigationController.hideShowBarDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? HomeTableViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? DetailViewController else {
                transitionContext.completeTransition(false)
                return
        }
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(toViewController.view)
        
        fromViewController.view.isHidden = true
        toViewController.view.isHidden = true
        
        let imageSnapshot = UIImageView(image: fromViewController.selectedCellImage?.image)
        imageSnapshot.contentMode = .scaleAspectFit
        
        let backgroundView = UIView()
        backgroundView.frame = fromViewController.view.frame
        backgroundView.backgroundColor = UIColor.white
        containerView.addSubview(backgroundView)
        
        containerView.addSubview(imageSnapshot)
        containerView.bringSubviewToFront(imageSnapshot)
        imageSnapshot.frame = containerView.convert(fromViewController.selectedCellImage!.frame, from: fromViewController.selectedCellImage!.superview)
        
        let animator = {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                imageSnapshot.frame = CGRect(x: toViewController.view.frame.minX, y: 94, width: toViewController.view.frame.width, height: 200)
            }
        }()
        
        let animator2 = {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                //backgroundView.alpha = 0.0
            }
        }()
        
        animator.addCompletion { _ in
            animator2.startAnimation()
        }
        
        animator2.addCompletion { _ in
            imageSnapshot.removeFromSuperview()
            backgroundView.removeFromSuperview()
            //fromViewController.view.removeFromSuperview()
            toViewController.view.isHidden = false
            //fromViewController.view.isHidden = false
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}
