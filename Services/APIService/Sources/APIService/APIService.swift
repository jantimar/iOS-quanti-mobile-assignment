//
//  File.swift
//  APIService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation

public protocol APIServiceProtocol {
    func fetch<T: Decodable>(resource: Resource) async throws -> T

    func fetch<T: Decodable>(
        headers: [HeaderKey: String],
        resource: Resource
    ) async throws -> T
}

public struct APIService {
    private let session: URLSession
    private let decoder = JSONDecoder()

    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension APIService: APIServiceProtocol {
    public func fetch<T: Decodable>(resource: Resource) async throws -> T {
        try await fetch(
            headers: [
                .contentType: "application/json",
                .acceptType: "application/json"
            ],
            resource: resource
        )
    }

    public func fetch<T: Decodable>(
        headers: [HeaderKey: String],
        resource: Resource
    ) async throws -> T {
        let request = try URLRequest(resource: resource)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            return try decode(data)
        default:
            throw APIError.statusCode(httpResponse.statusCode)
        }
    }

    private func decode<T: Decodable>(_ data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}
