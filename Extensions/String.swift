//
//  String.swift
//  vindecoder
//
//  Created by Seweryn Katolyk on 3/15/19.
//  Copyright © 2019 Seweryn Katolyk. All rights reserved.
//

import Foundation

extension String {
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
}
