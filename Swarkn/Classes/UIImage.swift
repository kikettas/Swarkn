//
//  UIImage.swift
//
//  Created by kikettas on 02/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension UIImage{
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    
    /**
     It indicates resize a given image
     
     - Parameter newWidth: new width
     - Parameter newHeight: new height
     
     ## Tip
     Not use this method on the main thread.
     
     - Returns: Resized image
     */
    
    public func resizedImage(newWidth: CGFloat, newHeight:CGFloat? = nil) -> UIImage? {
        
        let scale = newWidth / self.size.width
        var finalHeight:CGFloat
        if let height = newHeight{
            finalHeight = height
        }else{
            finalHeight = self.size.height * scale
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: finalHeight), false, 2)
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: finalHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
