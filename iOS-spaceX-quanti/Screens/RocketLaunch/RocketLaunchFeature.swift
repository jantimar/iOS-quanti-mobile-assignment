//
//  RocketLaunchFeature.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RocketLaunchFeature {

    @Dependency(\.motion) var motionManager

    @ObservableState
    struct State: Equatable {
        var started = false
    }

    enum Action {
        case start
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .start:
                state.started = true
                return .none
            }
        }
    }
}
