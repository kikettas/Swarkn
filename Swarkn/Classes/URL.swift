//
//  URL.swift
//
//  Created by kikettas on 22/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Validation{
    public struct URL{
        
        /**
         It indicates if a url instroduced has a valid format
         
         - Parameter url: The url to validate
         
         - Returns: If the given url is valid.
         */
        
        public static func isURLValid(url: String) -> Bool {
            guard let url = Foundation.URL(string: string) else {return false}
            if !UIApplication.shared.canOpenURL(url) {return false}
            
            let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
            let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
            return predicate.evaluate(with: string)
        }
    }
}
