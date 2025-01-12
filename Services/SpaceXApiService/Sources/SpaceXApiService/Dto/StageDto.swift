//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct StageDto: Codable {
    enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case fuelAmongTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustValuum = "thrust_vacuum"
        case thrust
        case payloads
    }

    let reusable: Bool?
    let engines: Int?
    let fuelAmongTons: Double?
    let burnTimeSec: Double?
    let thrustSeaLevel: ThrustDto?
    let thrustValuum: ThrustDto?
    let thrust: ThrustDto?
    let payloads: PayloadsDto?
}

extension Stage {
    init(from dto: StageDto) {
        self.init(
            reusable: dto.reusable,
            engines: dto.engines,
            fuelAmongTons: dto.fuelAmongTons,
            burnTimeSec: dto.burnTimeSec,
            thrustSeaLevel: dto.thrustSeaLevel.map(Thrust.init(from:)),
            thrustValuum: dto.thrustValuum.map(Thrust.init(from:)),
            thrust: dto.thrust.map(Thrust.init(from:)),
            payloads: dto.payloads.map(Payloads.init(from:))
        )
    }
}
