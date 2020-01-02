//
//  ArrayExtension.swift
//  tableView Test for iPresent
//
//  Created by Georg on 28/04/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import Foundation


public extension Array where Element: Equatable {
    
    // Convert to Array to Set Data Structure - set contains ordered unique values
    func mapToSet<T: Hashable>(_ transform: (Element) -> T) -> Set<T> {
        var result = Set<T>()
        for item in self {
            result.insert(transform(item))
        }
        return result
    }
    
    // Add new element at index [0]
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    // Delete all duplicate values from array. Unlike Set data structure, does not change elements' order
    mutating func removeDuplicates() -> [Element] {
        self = reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
        return self
    }
    
}
