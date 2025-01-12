//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Mass: Equatable {
    public let kilograms: Double?
    public let pounds: Double?

    public init(kilograms: Double?, pounds: Double?) {
        self.kilograms = kilograms
        self.pounds = pounds
    }
}

extension Mass {
    public func value(locale: Locale = .current) -> Double? {
        switch locale.measurementSystem {
        case .us:
            return pounds
        default:
            return kilograms
        }
    }

    public func formatted(locale: Locale = .current) -> String? {
        switch locale.measurementSystem {
        case .us:
            guard let pounds = pounds else { return nil }
            return Foundation.Measurement(value: pounds, unit: UnitMass.pounds)
                .converted(to: .shortTons).formatted()
        default:
            guard let kilograms = kilograms else { return nil }
            return Foundation.Measurement(value: kilograms, unit: UnitMass.kilograms)
                .converted(to: .metricTons).formatted()
        }
    }
}
