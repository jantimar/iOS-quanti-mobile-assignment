//
//  RocketListFeature.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import ComposableArchitecture
import Models

@Reducer
struct RocketListFeature {

    @Dependency(\.apiService) var apiService

    @ObservableState
    struct State {
        var rockets: DataState<[Rocket]> = .unknown
        // Destinations
        var path = StackState<Destination.State>()
    }

    enum Action {
        case refreshRockets
        case error(Error)
        case rockets([Rocket])

        // Navigation
        case show(rocket: Rocket)
        case path(StackAction<Destination.State, Destination.Action>)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .refreshRockets:
                state.rockets = .loading

                return .run { send in
                    do {
                        let rockets = try await self.apiService.fetchRockets()
                        await send(.rockets(rockets) )
                    } catch {
                        await send(.error(error))
                    }
                }
            case let .rockets(rockets):
                state.rockets = .data(rockets)
                return .none
            case let .error(error):
                state.rockets = .failure(error)
                return .none

            // Navigation
            case let .show(rocket: rocket):
                state.path.append(
                    .showRocket(
                        RocketDetailFeature.State(rocket: rocket)
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

extension RocketListFeature {
    @Reducer
    enum Destination {
        case showRocket(RocketDetailFeature)
    }
}
