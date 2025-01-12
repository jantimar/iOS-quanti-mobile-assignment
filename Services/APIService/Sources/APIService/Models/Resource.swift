//
//  File.swift
//  APIService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation

/// Helper structure for enable define any URL resource
public struct Resource {
    public let url: String
    public let method: URLMethod
    public let path: String

    public init(
        url: String,
        method: URLMethod = .get,
        path: String
    ) {
        self.url = url
        self.method = method
        self.path = path
    }

    public init?(
        url: String,
        method: URLMethod = .get,
        urlSuffix: String = ""
    ) {
        let absoluteString = url + urlSuffix
        guard let components = URLComponents(string: absoluteString) else {
            return nil
        }

        self.url = url
        self.path = components.path
        self.method = method
    }
}

extension Resource: Hashable {}

extension Resource {

    /// Return URL request withou HTTP body
    func createRequest() -> Result<URLRequest, APIError> {
        guard let request = try? URLRequest(resource: self) else {
            return .failure(.network("Invalid URL"))
        }
        return .success(request)
    }

    /// Return URL request with JSON HTTP body
    func createRequest<T: Encodable>(
        with httpBody: T
    ) -> Result<URLRequest, APIError> {
        switch createRequest() {
        case var .success(request):
            do {
                request.httpBody = try JSONEncoder().encode(httpBody)
                return .success(request)
            } catch {
                return .failure(.parsing(error))
            }
        case let .failure(error):
            return .failure(error)
        }
    }
}
