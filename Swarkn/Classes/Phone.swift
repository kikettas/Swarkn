//
//  File.swift
//
//  Created by kikettas on 10/10/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Validation{
    public struct Phone{
        static let countryPatternsDictionary: [String:String] = [
            "es":"^[9|6|7][0-9]{8}$"
        ]
        
        public static func isPhoneValid(withNumber number: String, countryCode: String) -> Bool{
            guard let pattern = countryPatternsDictionary[countryCode] else {
                return false
            }
            let expression = try! NSRegularExpression(pattern: pattern, options: [])
            let matches = expression.matches(in: number, options: [] , range: NSMakeRange(0, number.characters.count))
            
            return matches.count > 0
        }
        
    }
}
