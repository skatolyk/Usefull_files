//  ___FILEHEADER___

import ComposableArchitecture

@Reducer
struct ___VARIABLE_productName:identifier___Core {
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}

// MARK: - State
extension ___VARIABLE_productName:identifier___Core {
    @ObservableState
    struct State: Equatable {

    }
}

// MARK: - Action
extension ___VARIABLE_productName:identifier___Core {
    @CasePathable
    enum Action {
        case onAppear
    }
}
