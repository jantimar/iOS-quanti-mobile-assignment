//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Measurement: Equatable {
    public let meters: Double?
    public let feet: Double?

    public init(meters: Double?, feet: Double?) {
        self.meters = meters
        self.feet = feet
    }
}

extension Measurement {
    public func value(locale: Locale = .current) -> Double? {
        switch locale.measurementSystem {
        case .us:
            return feet
        default:
            return meters
        }
    }

    public func formatted(locale: Locale = .current) -> String? {
        switch locale.measurementSystem {
        case .us:
            guard let feet = feet else { return nil }
            return String(format: "%0.0f ft", feet)
        default:
            guard let meters = meters else { return nil }
            return String(format: "%0.0f m", meters)
        }
    }
}
