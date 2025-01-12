//
//  File.swift
//  APIService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation

public enum APIError: Error {
    case invalidResponse
    case statusCode(Int)
    case network(String)
    case parsing(Error)
}
