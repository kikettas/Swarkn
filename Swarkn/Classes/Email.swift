//
//  Email.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Validation{
    public struct Email{
        public static func isEmailValid(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}"
            let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            
            if !email.isEmpty && emailTest.evaluate(with: email as String) {
                return true
            }else{
                return false
            }
        }
    }}
