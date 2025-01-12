//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public enum DataState<T> {
    case loading
    case data(T)
    case failure(Error)
    case unknown
}

extension DataState: Equatable where T: Equatable {
    public static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (let .data(data1), let .data(data2)): return data1 == data2
        case (.failure, .failure): return true
        default: return false
        }
    }
}
