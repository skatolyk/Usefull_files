//
//  UIView.swift
//  vindecoder
//
//  Created by Admin on 2/7/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle(for: self))
    }
    
    class func viewFromNib<T: UIView>() -> T {
        return nib.instantiate(withOwner: self, options: nil).first as? T ?? T()
    }
}
