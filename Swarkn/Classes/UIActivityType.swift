//
//  UIActivityType.swift
//
//  Created by kikettas on 1/4/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation


extension UIActivityType{
    public var destinationShortName:String{
        get{
            switch self {
            case UIActivityType.postToFacebook:
                return "Facebook"
            case UIActivityType.postToVimeo:
                return "Vimeo"
            case UIActivityType.postToWeibo:
                return "Weibo"
            case UIActivityType.postToFlickr:
                return "Flickr"
            case UIActivityType.postToTwitter:
                return "Twitter"
            case UIActivityType.postToTencentWeibo:
                return "TencetWeibo"
            case UIActivityType.copyToPasteboard:
                return "Pasteboard"
            case UIActivityType.postToFacebook:
                return "Facebook"
            case UIActivityType.addToReadingList:
                return "Reading list"
            case UIActivityType.airDrop:
                return "airDrop"
            case UIActivityType.mail:
                return "Mail"
            case UIActivityType.message:
                return "Message"
            case UIActivityType.saveToCameraRoll:
                return "Camera roll"
            default:
                return "Other"
            }
        }
    }
}
