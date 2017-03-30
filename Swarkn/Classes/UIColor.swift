//
//  UIColor.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension UIColor{
    
    /**
     Initialize a color with hexValue
     
     - Parameter hexValue: color hex value (i.e: 0xf3f401)
     - Parameter alpha: alpha value
     
     */
    
    public convenience init(hexValue: UInt, alpha:CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
