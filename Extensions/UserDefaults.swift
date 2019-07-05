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
