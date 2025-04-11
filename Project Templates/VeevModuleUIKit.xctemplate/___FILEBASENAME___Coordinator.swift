//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___Router {
    
}

final class ___FILEBASENAME___: Coordinator {
    
    private weak var presenter: ___VARIABLE_productName:identifier___Presenter?
    private weak var viewController: ___VARIABLE_productName:identifier___ViewController?
    
    private func createViewController() -> ___VARIABLE_productName:identifier___ViewController {
        let viewController = ___VARIABLE_productName:identifier___ViewController()
        
        let presenter = ___VARIABLE_productName:identifier___Presenter(router: self, view: viewController)
        viewController.attach(presenter: presenter)
        
        self.presenter = presenter
        self.viewController = viewController
        
        return viewController
    }
    
    func push(to navigation: UINavigationController?, animated: Bool = true) {
        navigation?.pushViewController(createViewController(), animated: animated)
    }
}

// MARK: - ___VARIABLE_productName:identifier___Router
extension ___FILEBASENAME___: ___VARIABLE_productName:identifier___Router {
    
}
