//
//  Array.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/7/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Array<Element>.Index) -> Element? {
        get {
            return indices ~= index ? self[index] : nil
        }
        set {
            if index < count, let value = newValue {
                self[index] = value
            }
        }
    }
    
    /// Removes and returns the first element of the sequence that satisfies the given predicate
    @discardableResult
    mutating func removeFirst(where predicate: (Element) -> Bool) -> Element? {
        for (i, element) in enumerated() where predicate(element) {
            return remove(at: i)
        }
        return nil
    }
    
    mutating func append(_ newElement: Element, if predicate: Bool) {
        guard predicate else { return }
        append(newElement)
    }
    
    mutating func append(_ newElement: Element, if predicate: () -> Bool) {
        guard predicate() else { return }
        append(newElement)
    }
    
    mutating func insert(safe newElement: Element, at index: Int) {
        guard indices ~= index else {
            return append(newElement)
        }
        insert(newElement, at: index)
    }
}

extension Array where Element: Equatable {
    func contains(safe element: Element?) -> Bool {
        guard let element = element else {
            return false
        }
        return contains(element)
    }
    
    mutating func remove(_ object: Element) {
        guard let index = firstIndex(of: object) else { return }
        remove(at: index)
    }
}
