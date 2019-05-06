//
//  TransitionManager.swift
//  ESR_AppleTV
//
//  Created by Severyn-Wsevolod Katolyk on 5/8/18.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class TransitionManager {
    static let shared = TransitionManager()
    private init() {}
    var segueInProgress = false
}
