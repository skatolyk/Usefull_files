//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___PresenterProtocol: AnyObject {
    func didLoad()
}

final class ___FILEBASENAME___ {
    
    private let router: ___VARIABLE_productName:identifier___Router
    private weak var view: ___VARIABLE_productName:identifier___View?
    
    init(router: ___VARIABLE_productName:identifier___Router, view: ___VARIABLE_productName:identifier___View) {
        self.router = router
        self.view = view
    }
}

// MARK: - ___VARIABLE_productName:identifier___ViewOutput
extension ___FILEBASENAME___: ___VARIABLE_productName:identifier___PresenterProtocol {
    func didLoad() {
        print(#function)
    }
}
