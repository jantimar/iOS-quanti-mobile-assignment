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
    }

    enum Action {
        case refreshRockets
        case error(Error)
        case rockets([Rocket])
        // Navigtion
        case show(rocket: Rocket)
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
            case .show:
                return .none
            }
        }
    }
}
