//
//  String.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 3/15/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

extension String {
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
}
