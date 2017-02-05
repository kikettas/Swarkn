//
//  UINavigationControllers.swift
//
//  Created by kikettas on 1/27/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
    
    /**
     Remove the bar bottom line of a navigationBar (quite small line)
     
     - Parameter forNavBarWithColor: current nav bar color
     
     */
    
    public func hideNavigationBarBottomLine(forNavBarWithColor:UIColor){
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = forNavBarWithColor
    }
}
