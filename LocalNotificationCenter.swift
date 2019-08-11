//
//  LocalNotificationCenter.swift
//
//
//  Created by Severyn-Wsevolod Katolyk on 3/26/18.
//  Copyright © 2018 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

struct LocalNotificationCenter {
    enum Message: String {
        case willAuthenticate = "willAuthenticate"
        
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
    
    static func post(name: NSNotification.Name, object: Any? = nil, userInfo: [String: Any]? = nil) {
        notificationCenter.post(name: name, object: object, userInfo: userInfo)
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
    
    private init() { }
}
