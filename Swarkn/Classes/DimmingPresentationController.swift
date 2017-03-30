//
//  DimmingPresentationViewController.swift
//
//  Created by Enrique del Pozo Gómez on 1/17/17.
//  Copyright © 2017 kikettas. All rights reserved.
//

import Foundation


open class DimmingPresentationController: UIPresentationController{
    fileprivate var dimmingView:UIView!
    open var didTapOutside:(() -> ())?
    
    override public init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.setupDimmingView()
    }
    
    func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    dynamic func handleTap() {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    
    override open func presentationTransitionWillBegin() {
        
        // 1
        containerView?.insertSubview(dimmingView, at: 0)
        
        // 2
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|",
                                           options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|",
                                           options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        
        dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DimmingPresentationController.didTapOutsideAction)))
        //3
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        coordinator.animate(alongsideTransition: {_ in
            self.dimmingView.alpha = 1.0
        }, completion: nil)
        
    }
    
    override open func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }
        coordinator.animate(alongsideTransition: {_ in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    
    override open func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    @objc private func didTapOutsideAction(){
        if let didTapOutside = didTapOutside{
            didTapOutside()
        }
    }
    
    open func setupDidTapOutside(didTap:(() -> ())?){
        didTapOutside = didTap
    }
}
