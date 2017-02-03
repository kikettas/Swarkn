//
//  Utils.swift
//
//  Created by kikettas on 03/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation


public func takeScreenShot(saveOnAlbum save:Bool = false) -> UIImage?{
    let layer = UIApplication.shared.keyWindow!.layer
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
    
    layer.render(in: UIGraphicsGetCurrentContext()!)
    let screenshot = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    if(save){
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }
    
    return screenshot
}


/**
 - brief Execute a closure after a delay
 - param delay Number of seconds
 - param closre Closure that will be executed after the delay
 */


public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

public func randomIndex(forElements:[Int], inArrayWithSize size:Int) -> Int{
    srand48(forElements.reduce(0,+))
    return Int((drand48() * 10000).truncatingRemainder(dividingBy: Double(size)))
}
