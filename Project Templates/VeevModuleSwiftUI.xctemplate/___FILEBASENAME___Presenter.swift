//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___PresenterProtocol: AnyObject {
    func didLoad()
}

final class ___FILEBASENAME___ {
    
    private let router: ___VARIABLE_productName:identifier___Router
    
    init(router: ___VARIABLE_productName:identifier___Router) {
        self.router = router
    }
}

// MARK: - ___VARIABLE_productName:identifier___ViewOutput
extension ___FILEBASENAME___: ___VARIABLE_productName:identifier___PresenterProtocol {
    func didLoad() {
        print(#function)
    }
}
