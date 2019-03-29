//
//  AlertController.swift
//  ESR_AppleTV
//
//  Created by Admin on 2/12/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

final class AlertController {
    typealias Callback = (UIAlertAction) -> Void
    
    static func show(title: String? = nil, message: String? = nil, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindow.Level.alert
        window.makeKeyAndVisible()
        window.rootViewController?.present(alert, animated: true)
    }
    
    static func showInformation(title: String? = nil, message: String? = nil, actionTitle: String = "OK", callback: Callback? = nil) {
        let okAction = UIAlertAction(title: actionTitle, style: .cancel) { action in
            callback?(action)
        }
        
        show(title: title, message: message, actions: [okAction])
    }
    
    static func show(error: String = "Error", message: String? = nil, callback: Callback? = nil) {
        showInformation(title: error, message: message, callback: callback)
    }
    
    static func showError(message: String? = nil, actions: [UIAlertAction]) {
        show(title: "Error", message: message, actions: actions)
    }
}
