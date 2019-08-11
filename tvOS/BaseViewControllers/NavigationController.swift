//
//  NavigationController.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 5/8/18.
//  Copyright © 2018 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    var segueInProgress = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if TransitionManager.shared.segueInProgress || segueInProgress {
            return
        }
        segueInProgress = true
        super.present(viewControllerToPresent, animated: flag) { [weak self] in
            self?.segueInProgress = false
            completion?()
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if TransitionManager.shared.segueInProgress || segueInProgress {
            return
        }
        super.pushViewController(viewController, animated: animated)
    }
}
