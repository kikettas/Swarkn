//
//  Constants.swift
//
//  Created by kikettas on 24/10/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit

public let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
public let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

public struct ScreenType{
    public static let IPHONE4 = UIScreen.main.bounds.size.height < 568
    public static let IPHONE5 = UIScreen.main.bounds.size.height == 568
    public static let IPHONE6 = UIScreen.main.bounds.size.height == 667
    public static let IPHONE6P = UIScreen.main.bounds.size.height == 736
}
