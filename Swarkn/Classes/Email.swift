//
//  Email.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Validation{
    public struct Email{
        
        /**
         It indicates if the email instroduced has a valid format
         
         - Parameter email: The email to validate
         - Returns: If the given email is valid.
         */
        public static func isEmailValid(email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}"
            let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            
            if !email.isEmpty && emailTest.evaluate(with: email as String) {
                return true
            }else{
                return false
            }
        }
    }}
