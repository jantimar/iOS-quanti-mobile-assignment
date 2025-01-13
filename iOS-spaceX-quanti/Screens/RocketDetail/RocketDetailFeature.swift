//
//  RocketDetailFeature.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import ComposableArchitecture
import Models

@Reducer
struct RocketDetailFeature {

    @ObservableState
    struct State: Equatable {
        let rocket: Rocket
    }

    enum Action {
        case launch
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .launch:
                return .none
            }
        }
    }
}
