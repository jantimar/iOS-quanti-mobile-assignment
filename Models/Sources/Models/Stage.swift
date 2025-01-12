//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Stage: Equatable {
    public let reusable: Bool?
    public let engines: Int?
    public let fuelAmongTons: Double?
    public let burnTimeSec: Double?
    public let thrustSeaLevel: Thrust?
    public let thrustValuum: Thrust?
    public let thrust: Thrust?
    public let payloads: Payloads?

    public init(
        reusable: Bool?,
        engines: Int?,
        fuelAmongTons: Double?,
        burnTimeSec: Double?,
        thrustSeaLevel: Thrust?,
        thrustValuum: Thrust?,
        thrust: Thrust?,
        payloads: Payloads?
    ) {
        self.reusable = reusable
        self.engines = engines
        self.fuelAmongTons = fuelAmongTons
        self.burnTimeSec = burnTimeSec
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustValuum = thrustValuum
        self.thrust = thrust
        self.payloads = payloads
    }
}
