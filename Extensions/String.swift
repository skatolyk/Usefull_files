//
//  String.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 3/15/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

extension String {
    static func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = NSString(string: text)
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(labelSize.width)
    }
    
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    mutating func append(_ other: String, if predicate: Bool) {
        guard predicate else { return }
        append(other)
    }
    
    mutating func append(_ other: String, if predicate: () -> Bool) {
        guard predicate() else { return }
        append(other)
    }
    
    /// Removes and returns the first character that satisfies the given predicate
    @discardableResult
    mutating func removeFirst(where predicate: (Character) -> Bool) -> Character? {
        guard let index = firstIndex(where: predicate) else { return nil }
        return remove(at: index)
    }
    
    /// Removes and returns the last character that satisfies the given predicate
    @discardableResult
    mutating func removeLast(where predicate: (Character) -> Bool) -> Character? {
        guard let index = lastIndex(where: predicate) else { return nil }
        return remove(at: index)
    }
}
