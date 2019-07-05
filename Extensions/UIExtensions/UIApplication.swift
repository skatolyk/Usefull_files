//
//  UIApplication.swift
//
//
//  Created by Severyn-Wsevolod Katolyk on 2/18/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

extension UIApplication {
    static var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}
