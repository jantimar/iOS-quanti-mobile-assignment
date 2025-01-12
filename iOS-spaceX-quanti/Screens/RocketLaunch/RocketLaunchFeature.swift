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

    @ObservableState
    struct State: Equatable {
    }

    enum Action {
        case none
    }

    var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
    }
}
