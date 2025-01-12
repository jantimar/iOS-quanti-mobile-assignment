//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct EngineDto: Codable {
    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case thrust
        case type
        case number
        case version
        case layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }

    let isp: IspDto?
    let thrustSeaLevel: ThrustDto?
    let thrustVacuum: ThrustDto?
    let thrust: ThrustDto?
    let type: String?
    let number: Int?
    let version: String?
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String?
    let propellant2: String?
    let thrustToWeight: Double?
}

extension Engine {
    init(from dto: EngineDto) {
        self.init(
            isp: dto.isp.map(Isp.init(from:)),
            thrustSeaLevel: dto.thrustSeaLevel.map(Thrust.init(from:)),
            thrustVacuum: dto.thrustVacuum.map(Thrust.init(from:)),
            thrust: dto.thrust.map(Thrust.init(from:)),
            type: dto.type,
            number: dto.number,
            version: dto.version,
            layout: dto.layout,
            engineLossMax: dto.engineLossMax,
            propellant1: dto.propellant1,
            propellant2: dto.propellant2,
            thrustToWeight: dto.thrustToWeight
        )
    }
}
