//
//  Array.swift
//
//  Created by kikettas on 16/11/2016.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Array where Element : Hashable {
    public var unique: [Element] {
        return Array(Set(self))
    }
}
