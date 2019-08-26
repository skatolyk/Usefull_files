//
//  NSMutableAttributedString.swift
//
//
//  Created by Severyn-Wsevolod Katolyk on 11/1/18.
//  Copyright © 2018 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func append(_ string: String) {
        append(NSAttributedString(string: string))
    }
    
    func append(_ string: String, if predicate: Bool) {
        append(attrString: NSAttributedString(string: string), if: predicate)
    }
    
    func append(attrString: NSAttributedString, if predicate: Bool) {
        guard predicate else { return }
        append(attrString)
    }
}
