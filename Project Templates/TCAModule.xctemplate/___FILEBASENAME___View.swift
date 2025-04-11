//  ___FILEHEADER___

import SwiftUI
import ComposableArchitecture

struct ___FILEBASENAME___: View {
    let store: StoreOf<___VARIABLE_productName:identifier___Core>

    var body: some View {
        Text("")
    }
}

#if DEBUG
// MARK: - Previews
#Preview {
    ___FILEBASENAME___(store: .init(
        initialState: ___VARIABLE_productName:identifier___Core.State(),
        reducer: { ___VARIABLE_productName:identifier___Core() }
    ))
}
#endif
