//
//  String.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016  All rights reserved.
//

import Foundation

extension String{
    public func ignoreAccents() -> String {
        return self.folding(options: .diacriticInsensitive, locale: Locale.current)
    }
    
    public func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func replaceFirstCharacter(withString string:String) -> String{
        return self.replacingCharacters(in: self.startIndex..<self.characters.index(after: self.startIndex), with: string)
    }
    
    public func substringWithRange(fromPosition from: Int, to: Int) -> String{
        return self.substring(with: self.characters.index(self.startIndex, offsetBy: from)..<self.characters.index(self.startIndex, offsetBy: to))
    }
}
