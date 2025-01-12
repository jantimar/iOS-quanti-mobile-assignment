//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Engine: Equatable {
    public let isp: Isp?
    public let thrustSeaLevel: Thrust?
    public let thrustVacuum: Thrust?
    public let thrust: Thrust?
    public let type: String?
    public let number: Int?
    public let version: String?
    public let layout: String?
    public let engineLossMax: Int?
    public let propellant1: String?
    public let propellant2: String?
    public let thrustToWeight: Double?

    public init(
        isp: Isp?,
        thrustSeaLevel: Thrust?,
        thrustVacuum: Thrust?,
        thrust: Thrust?,
        type: String?,
        number: Int?,
        version: String?,
        layout: String?,
        engineLossMax: Int?,
        propellant1: String?,
        propellant2: String?,
        thrustToWeight: Double?
    ) {
        self.isp = isp
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustVacuum = thrustVacuum
        self.thrust = thrust
        self.type = type
        self.number = number
        self.version = version
        self.layout = layout
        self.engineLossMax = engineLossMax
        self.propellant1 = propellant1
        self.propellant2 = propellant2
        self.thrustToWeight = thrustToWeight
    }
}
