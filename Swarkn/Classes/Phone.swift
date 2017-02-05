//
//  Phone.swift
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
        
        /**
         It indicates if a phone number of a countryCode instroduced has a valid format
         
         - Parameter withNumber: The number to validate
         - Parameter countryCode: The countryCode to validate

         - Returns: If the given phone is valid.
         */
        
        public static func isPhoneValid(withNumber: String, countryCode: String) -> Bool{
            guard let pattern = countryPatternsDictionary[countryCode] else {
                return false
            }

            let expression = try! NSRegularExpression(pattern: pattern, options: [])
            let matches = expression.matches(in: withNumber, options: [] , range: NSMakeRange(0, withNumber.characters.count))
            
            return matches.count > 0
        }
        
    }
}
