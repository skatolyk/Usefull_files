//
//  KeyboardAwareViewController.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/18/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

protocol KeyboardAwareViewController: UIViewController {
    func keyboardWillChange(height: CGFloat)
}

extension KeyboardAwareViewController {
    func startListenKeyboardEvents() {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillShow(notification: notification)
        }
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillHide(notification: notification)
        }
    }
    
    func stopListenKeyboardEvents() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        var keyboardHeight = endFrame?.height ?? 0
        
        if let tabBar = tabBarController?.tabBar, !tabBar.isHidden {
            let tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0
            keyboardHeight -= tabBarHeight
        }
        
        keyboardWillChange(height: keyboardHeight, userInfo: userInfo)
    }
    
    func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        keyboardWillChange(height: 0, userInfo: userInfo)
    }
    
    private func keyboardWillChange(height: CGFloat, userInfo: [AnyHashable: Any]) {
        keyboardWillChange(height: height)
        
        let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: animationCurve,
                       animations: { self.view.layoutIfNeeded() },
                       completion: nil)
    }
}
