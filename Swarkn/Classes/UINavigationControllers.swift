//
//  UINavigationControllers.swift
//
//  Created by kikettas on 1/27/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
    public func hideNavigationBarBottomLine(forNavBarWithColor:UIColor){
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = forNavBarWithColor
    }
}
