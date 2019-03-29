//
//  Array.swift
//  vindecoder
//
//  Created by Admin on 2/7/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: UInt) -> Element? {
        get {
            return indices ~= Int(index) ? self[Int(index)] : nil
        }
        set {
            if Int(index) < count, let value = newValue {
                self[Int(index)] = value
            }
        }
    }
}
