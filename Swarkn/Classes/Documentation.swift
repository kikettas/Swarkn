//
//  Documentation.swift
//
//  Created by kikettas on 12/14/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Validation{
    public struct Documentation{
        public static func isSpanishIDCardValid (_ id:String) -> Bool{
            var nifControl = ["T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J",
                              "Z", "S", "Q", "V", "H", "L", "C", "K", "E"]
            var idnumber = id.trim()
            
            let dniPattern = try! NSRegularExpression(pattern:"((\\d{8})([-]?)([A-Z]{1}))", options: [])
            let niePattern = try! NSRegularExpression(pattern:"(([X-Z]{1})([-]?)(\\d{7})([-]?)([A-Z]{1}))", options: [])
            
            let dniMatches = dniPattern.matches(in: idnumber, options: [], range: NSMakeRange(0, idnumber.characters.count))
            let nieMatches = niePattern.matches(in: idnumber, options: [], range: NSMakeRange(0, idnumber.characters.count))
            
            
            if(dniMatches.count > 0 || nieMatches.count > 0){
                idnumber = idnumber.replacingOccurrences(of: "-", with: "")
                
                if(nieMatches.count > 0){
                    switch idnumber.characters.first!{
                    case "X":
                        idnumber = idnumber.replaceFirstCharacter(withString: "0")
                        break
                    case "Y":
                        idnumber = idnumber.replaceFirstCharacter(withString: "1")
                        break
                    case "Z":
                        idnumber = idnumber.replaceFirstCharacter(withString: "2")
                        break
                    default:
                        return false
                    }
                }
                
                let controlLetter = String(idnumber.characters.last!)
                let dniNumber = Int(String(idnumber.characters.dropLast()))
                return nifControl[dniNumber! % 23] == controlLetter
            }else{
                return false
            }
        }
        
        public static func isSSNValid(socialSecurityNumber ssn:String) -> Bool{
            let ssnPattern = try! NSRegularExpression(pattern:"(\\d{12})", options: [])
            let ssnMatches = ssnPattern.matches(in: ssn, options: [], range: NSMakeRange(0, ssn.characters.count))
            
            if(ssnMatches.count > 0){
                let a = Int(ssn.substringWithRange(fromPosition: 0, to: 2))
                let b = Int(ssn.substringWithRange(fromPosition: 2, to: 10))
                let c = Int(ssn.substringWithRange(fromPosition: 10, to: 12))
                
                var d:Int = 0
                
                if(b < 10000000){
                    d = b! + a! * 10000000
                }else{
                    let ab:String = String(a!) + String(b!)
                    d = Int(ab)!
                }
                return c! == (d % 97)
            }else{
                return false
            }
        }
    }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}
