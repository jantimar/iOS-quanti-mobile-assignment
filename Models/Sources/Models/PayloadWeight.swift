//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct PayloadWeight: Equatable {
    public let id: String
    public let name: String?
    public let kilograms: Double?
    public let pounds: Double?

    public init(id: String, name: String?, kilograms: Double?, pounds: Double?) {
        self.id = id
        self.name = name
        self.kilograms = kilograms
        self.pounds = pounds
    }
}
