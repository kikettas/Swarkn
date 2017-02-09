//
//  Collection.swift
//  Pods
//
//  Created by Enrique del Pozo Gómez on 2/9/17.
//
//

import Foundation


extension Collection where Indices.Iterator.Element == Index {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
