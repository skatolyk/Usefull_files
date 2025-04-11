//  ___FILEHEADER___

import SwiftUI

struct ___FILEBASENAME___: View {
    
    private let presenter: ___VARIABLE_productName:identifier___PresenterProtocol
    
    init(presenter: ___VARIABLE_productName:identifier___PresenterProtocol) {
        self.presenter = presenter
    }
    
    var body: some View {
        Text("New Screen")
    }
}

struct ___FILEBASENAME____Previews: PreviewProvider {
    static var previews: some View {
        let router = ___VARIABLE_productName:identifier___Coordinator()
        let presenter = ___VARIABLE_productName:identifier___Presenter(router: router)
        ___FILEBASENAME___(presenter: presenter)
    }
}
