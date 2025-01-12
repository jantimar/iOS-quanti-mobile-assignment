//
//  File.swift
//  APIService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation

extension URLRequest {
    /// Create URL request from Resouce
    init(resource: Resource) throws {
        var components = URLComponents(string: resource.url)
        components?.path = resource.path

        guard let url = components?.url else {
            throw APIError.network("Invalid URL")
        }

        self.init(url: url)
        self.httpMethod = resource.method.rawValue
        self.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    }
}
