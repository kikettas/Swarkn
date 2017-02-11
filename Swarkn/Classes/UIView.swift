//
//  UIView.swift
//  Pods
//
//  Created by Enrique del Pozo Gómez on 2/11/17.
//
//

import Foundation
import UIKit


extension UIView{
    
    /**
     Set border and radius to the current view
     
     - Parameter color: Border color
     - Parameter width: Border width
     - Parameter cornerRadius: Corner radius

     */
    
    public func setBorderAndRadius(color: CGColor = UIColor.white.cgColor, width:CGFloat = 2.0, cornerRadius:CGFloat = 5){
        self.layer.borderWidth = width
        self.layer.borderColor = color
        self.layer.cornerRadius = cornerRadius
    }
    
    /**
     Set elevation
     
     - Parameter x: x
     - Parameter y: y
     
     */
    
    public func setElevation(x:CGFloat = 0, y:CGFloat = 5){
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize(width: x, height: y);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
    }
    
    /**
     Mask an ImageView in a circle
     
     - Parameter borderWidth: border width
     - Parameter borderColor: border color
     
     */
    
    public func maskWithCircle(borderWidth:CGFloat = 2, borderColor: CGColor = UIColor.white.cgColor){
        let layer = self.layer
        layer.cornerRadius = self.frame.size.width/2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.masksToBounds = true
    }
    
    /**
     Drop shadow to view
     
     - Parameter opacity: Shadow opacity
     - Parameter offset: Shadow offset
     - Parameter radius: Shadow radius
     
     */
    
    
    public func setShadow(opacity:Float = 0.2, offset:CGSize = CGSize(width: 0, height: 2), radius: CGFloat = 2.0) {
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    /**
     Mask as Circle
     
     - Parameter borderWidth: Border width
     - Parameter color: Border color
     
     */
    
    public func maskCircle(borderWidth:CGFloat = 0.0, color:CGColor = UIColor.white.cgColor) {
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color
    }
    
    /**
     Fade in animation
     
     - Parameter duration: Animation duration
     - Parameter delay: Animation delay
     - Parameter completion: Completion closure
     
     */
    
    public func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    /**
     Fade out animation
     
     - Parameter duration: Animation duration
     - Parameter delay: Animation delay
     - Parameter completion: Completion closure
     
     */
    
    public func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    /**
     Collapse animation
     
     - Parameter height: final heigth
     - Parameter duration: Animation duration
     - Parameter delay: Animation delay
     - Parameter completion: Completion closure
     
     */
    
    public func collapseTo(height:CGFloat, duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: height)
            
        }, completion: completion)
    }
    
    /**
     Expand animation
     
     - Parameter height: final heigth
     - Parameter duration: Animation duration
     - Parameter delay: Animation delay
     - Parameter completion: Completion closure
     
     */
    
    public func expandTo(height:CGFloat,duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: height)
        }, completion: completion)
    }

}
