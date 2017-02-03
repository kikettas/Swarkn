//
//  UIColor.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension UIColor{
    public convenience init(rgbValue: UInt, alpha:CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
