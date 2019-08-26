//
//  UserDefaults.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/14/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    private static let defaults = UserDefaults.standard
    
    static var email: String? {
        get { return defaults.string(forKey: Key.email) }
        set { defaults.set(email, forKey: Key.email) }
    }
}

// MARK: - Privates
private extension UserDefaults {
    static func get<T: JSONConvertable>(forKey key: String) -> T? {
        guard let decodedDataObject = UserDefaults.standard.object(forKey: key) as? Data,
            let dict = NSKeyedUnarchiver.unarchiveObject(with: decodedDataObject) as? [String: AnyObject] else {
                return nil
        }
        return T(dict: dict)
    }
    
    static func set<T: JSONConvertable>(value: T, forKey key: String) {
        guard let dataObject = value.toJson() else { return }
        let object = NSKeyedArchiver.archivedData(withRootObject: dataObject)
        UserDefaults.standard.set(object, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
