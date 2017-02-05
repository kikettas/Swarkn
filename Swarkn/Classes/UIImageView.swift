//
//  UIImageView.swift
//
//  Created by kikettas on 02/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension UIImageView{
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
        layer.borderWidth = borderWitdth
        layer.borderColor = borderColor
        layer.masksToBounds = true
    }
}
