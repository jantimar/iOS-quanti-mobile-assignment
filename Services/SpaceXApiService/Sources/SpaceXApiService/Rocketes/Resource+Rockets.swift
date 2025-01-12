//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import APIService

extension Resource {

    /// GET all available rockets
    static func rockets(
        _ baseUrl: String
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/v4/rockets"
        )
    }
}
