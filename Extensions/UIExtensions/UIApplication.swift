//
//  UIApplication.swift
//  vindecoder
//
//  Created by Admin on 2/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension UIApplication {
    static var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}
