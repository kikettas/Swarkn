//
//  NSLocale.swift
//
//  Created by kikettas on 16/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Locale{
    public var availableLocaleIdentifiersWithoutUnderscore:[String] {
        return Locale.availableIdentifiers.map{ (id:String) -> String in
            if(id.contains("_")){
                return id.components(separatedBy: "_").first!
            }
            return id
        }.unique
    }
    
    // i.e: [spanish:es]
    
    public func languagesLocaleISO639_1() -> [String:String]{
        var dict: [String:String] = [:]
        
        for localeID in availableLocaleIdentifiersWithoutUnderscore{
            if let name = (self as NSLocale).displayName(forKey: NSLocale.Key.identifier, value: localeID.substring(to: localeID.characters.index(localeID.startIndex, offsetBy: 2))){
                dict[name] = localeID.substring(to: localeID.characters.index(localeID.startIndex, offsetBy: 2))
            }
        }
        
        return dict
    }
    
    public func languagesLocaleISO639_3() -> [String:String]{
        var dict: [String:String] = [:]
        
        for localeID in availableLocaleIdentifiersWithoutUnderscore{
            if let name = (self as NSLocale).displayName(forKey: NSLocale.Key.identifier, value: localeID){
                dict[name] = localeID
            }
        }
        
        return dict
    }
    
    public func countryName(forISOCode ISOCountryCode: String?) -> String? {
        if let ISOCountryCode = ISOCountryCode {
            return (Locale(identifier: DateFormatter().locale.identifier) as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: ISOCountryCode)
        }
        return nil
    }
    
    // i.e: [spain:es]
    public func countryNamesAndCodes() -> [String:String] {
        var namesAndCodes:[String:String] = [:]
        for countryCode in Locale.isoRegionCodes{
            if let name = countryName(forISOCode: countryCode){
                namesAndCodes[name] = countryCode
            }
        }
        return namesAndCodes
    }
}
