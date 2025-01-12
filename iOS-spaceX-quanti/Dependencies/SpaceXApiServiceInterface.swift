//
//  SpaceXApiServiceInterface.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation
import Models
import SpaceXApiService
import ComposableArchitecture

struct SpaceXApiServiceInterface {
    /// Fetch all available rockets
    var fetchRockets: () async throws -> [Rocket]
}

extension SpaceXApiServiceInterface: DependencyKey {
    static var liveValue: SpaceXApiServiceInterface {
        let apiService = SpaceXApiService(
            baseUrl: "https://api.spacexdata.com/"
        )

        return SpaceXApiServiceInterface(
            fetchRockets: apiService.fetchRockets
        )
    }
}

extension DependencyValues {
    var apiService: SpaceXApiServiceInterface {
        get { self[SpaceXApiServiceInterface.self] }
        set { self[SpaceXApiServiceInterface.self] = newValue }
    }
}
