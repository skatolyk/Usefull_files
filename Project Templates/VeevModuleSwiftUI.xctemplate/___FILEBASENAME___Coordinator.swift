//  ___FILEHEADER___

import UIKit
import SwiftUI

protocol ___VARIABLE_productName:identifier___Router {
    
}

final class ___FILEBASENAME___: Coordinator {
    
    private weak var presenter: ___VARIABLE_productName:identifier___Presenter?
    private weak var hostingController: UIHostingController<___VARIABLE_productName:identifier___View>?
    
    private func createViewController() -> UIHostingController<___VARIABLE_productName:identifier___View> {
        let presenter = ___VARIABLE_productName:identifier___Presenter(router: self)
        let view = ___VARIABLE_productName:identifier___View(presenter: presenter)
        let hostingController = UIHostingController(rootView: view)
        
        self.presenter = presenter
        self.hostingController = hostingController
        
        return hostingController
    }
    
    func push(to navigation: UINavigationController?, animated: Bool = true) {
        navigation?.pushViewController(createViewController(), animated: animated)
    }
}

// MARK: - ___VARIABLE_productName:identifier___Router
extension ___FILEBASENAME___: ___VARIABLE_productName:identifier___Router {
    
}
