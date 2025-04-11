//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___View: AnyObject {
    
}

final class ___FILEBASENAME___: UIViewController {
    
    private var presenter: ___VARIABLE_productName:identifier___PresenterProtocol! // swiftlint:disable:this implicitly_unwrapped_optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
    
    func attach(presenter: ___VARIABLE_productName:identifier___PresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - ___VARIABLE_productName:identifier___View
extension ___FILEBASENAME___: ___VARIABLE_productName:identifier___View {
    
}
