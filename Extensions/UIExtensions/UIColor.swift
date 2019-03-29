//
//  UIColor.swift
//  vindecoder
//
//  Created by Admin on 2/7/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension UIColor {
    static var customWhite: UIColor {
        return UIColor(r: 246, g: 246, b: 246)
    }
    
    /// Auto converting to byte representation
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}
