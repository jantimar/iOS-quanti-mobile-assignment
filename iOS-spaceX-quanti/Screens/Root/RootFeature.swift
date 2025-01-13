//
//  RootFeature.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 14.01.2025.
//

import Foundation
import Models
import ComposableArchitecture

@Reducer
struct RootFeature {

    @ObservableState
    struct State {
        var root: RocketListFeature.State
        var path = StackState<Destination.State>()
    }

    enum Action {
        case root(RocketListFeature.Action)
        // Navigation
        case path(StackAction<Destination.State, Destination.Action>)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.root, action: \.root) {
            RocketListFeature()
        }

        Reduce { state, action in
            switch action {
            case .root(let .show(rocket: rocket)):
                state.path.append(
                    .showRocket(
                        RocketDetailFeature.State(rocket: rocket)
                    )
                )
                return .none
            case .root:
                return .none

            case .path(
                .element(
                    id: _,
                    action: .showRocket(.launch)
                )
            ):
                state.path.append(
                    .showLaunchRocket(
                        RocketLaunchFeature.State()
                    )
                )
                return .none
            case .path(.popFrom):
                state.path.removeAll()
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

extension RootFeature {
    @Reducer
    enum Destination {
        case showRocket(RocketDetailFeature)
        case showLaunchRocket(RocketLaunchFeature)
    }
}
