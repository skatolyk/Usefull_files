//
//  UIViewController.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/7/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
    
    var classIdentifier: String {
        return String(describing: type(of: self))
    }
    
    static func instantiateViewController<T: UIViewController>(_ bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T ?? T()
    }
}
