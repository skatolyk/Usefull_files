//
//  LocalNotificationCenter.swift
//  ESR_AppleTV
//
//  Created by Severyn-Wsevolod Katolyk on 3/26/18.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class LocalNotificationCenter {
    enum Message: String {
        case appVersionLoadedNotification = "AppVersionLoadedNotification"
        case loginFinishWithFailNotification = "LoginFinishWithFailNotification" // TODO: (skatolyk) Posted but is never added
        case hideSideMenu
        case showSideMenu
        case resetApplicationNotification
        case internetIsOn
        case internetIsDown
        
        var name: NSNotification.Name {
            return NSNotification.Name(rawValue: rawValue)
        }
    }
    
    private static var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    static func post(message: Message, object: Any? = nil, userInfo: [String: Any]? = nil) {
        notificationCenter.post(name: message.name, object: object, userInfo: userInfo)
    }
    
    static func subscribe(observer: Any, selector: Selector, to message: Message) {
        notificationCenter.addObserver(observer, selector: selector, name: message.name, object: nil)
    }
    
    static func subscribe(observer: Any, selector: Selector, to name: NSNotification.Name?, object: Any? = nil) {
        notificationCenter.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    static func remove(observer: Any, for message: Message) {
        notificationCenter.removeObserver(observer, name: message.name, object: nil)
    }
    
    static func remove(observer: Any, for name: NSNotification.Name?) {
        notificationCenter.removeObserver(observer, name: name, object: nil)
    }
    
    static func remove(observer: Any) {
        notificationCenter.removeObserver(observer)
    }
}
