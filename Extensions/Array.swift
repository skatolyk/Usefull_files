//
//  Array.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/7/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
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
