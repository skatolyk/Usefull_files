//
//  ViewController.swift
//  ESR_AppleTV
//
//  Created by Severyn-Wsevolod Katolyk on 5/7/18.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.appDelegate?.window?.bringLogViewToFront()
        
        navigationController?.delegate = self
        view.setupSubviewsHorizontalOrientation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TransitionManager.shared.segueInProgress = false // TODO: (skatolyk) Check it!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        TransitionManager.shared.segueInProgress = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return !TransitionManager.shared.segueInProgress
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        guard shouldPerformSegue(withIdentifier: identifier, sender: sender) else { return }
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    func navigateShow(to viewController: UIViewController, sender: Any? = self) {
        if TransitionManager.shared.segueInProgress { return }
        
        if let navigationController = navigationController {
            navigationController.show(viewController, sender: sender)
        } else {
            show(viewController, sender: sender)
        }
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}


// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        TransitionManager.shared.segueInProgress = true
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        TransitionManager.shared.segueInProgress = false
    }
}
