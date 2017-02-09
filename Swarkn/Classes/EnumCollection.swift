//
//  EnumCollection.swift
//  Pods
//
//  Created by Enrique del Pozo Gómez on 2/8/17.
//
//

import Foundation

public protocol EnumCollection : Hashable {}

extension EnumCollection {
    
    /**
     Returns all cases of a EnumCollection
          
     - Returns: all enum cases
     */
    public static func cases() -> AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
}
