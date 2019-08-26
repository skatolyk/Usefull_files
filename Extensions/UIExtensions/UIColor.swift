//
//  UIColor.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/7/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

extension UIColor {
    static var customWhite: UIColor {
        return UIColor(r: 246, g: 246, b: 246)
    }
    
    convenience init?(hexCode: String, alpha: CGFloat = 1) {
        var hexString = hexCode.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let blue = CGFloat((rgb & 0x0000FF)) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Auto converting to byte representation
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}
