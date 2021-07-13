

import Foundation
import UIKit

class PopAnimator:NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(UINavigationController.hideShowBarDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? DetailViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? HomeTableViewController else {
                transitionContext.completeTransition(false)
                return
        }
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(toViewController.view)
        
        fromViewController.view.isHidden = true
        toViewController.view.isHidden = true
        
        let imageSnapshot = UIImageView(image: fromViewController.imageView.image)
        imageSnapshot.contentMode = .scaleAspectFit
        imageSnapshot.clipsToBounds = true
        
        let backgroundView = UIView()
        backgroundView.frame = fromViewController.view.frame
        backgroundView.backgroundColor = UIColor.white
        containerView.addSubview(backgroundView)
        
        containerView.addSubview(imageSnapshot)
        containerView.bringSubviewToFront(imageSnapshot)
        imageSnapshot.frame = containerView.convert(fromViewController.imageView.frame, from: fromViewController.imageView.superview)
    
        let rowRectToSuperview = toViewController.tableView.superview!.convert(toViewController.selectedCellImage!.frame, from: toViewController.tableView.cellForRow(at: toViewController.selectedIndexPath!))
        
        let animator = {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                imageSnapshot.frame = rowRectToSuperview
                imageSnapshot.layer.cornerRadius = 25
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
