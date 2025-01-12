//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models
import Utils

struct RocketDto: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case active
        case stages
        case boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case company
        case wikipedia
        case description
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case height
        case diameter
        case mass
        case landingLegs = "landing_legs"
        case flickrImages = "flickr_images"
        case payloadWeights = "payload_weights"
        case engines
    }

    let id: String
    let name: String?
    let type: String?
    let active: Bool?
    let stages: Int?
    let boosters: Int?
    let costPerLaunch: Int?
    let successRatePct: Double?
    let firstFlight: String?
    let country: String?
    let company: String?
    let wikipedia: String?
    let description: String?
    let firstStage: StageDto?
    let secondStage: StageDto?
    let height: MeasurementDto?
    let diameter: MeasurementDto?
    let mass: MassDto?
    let landingLegs: LandingLegsDto?
    let flickrImages: [String]?
    let payloadWeights: [PayloadWeightDto]?
    let engines: EngineDto?
}

extension Rocket {
    init(from dto: RocketDto) {
        self.init(
            id: dto.id,
            name: dto.name,
            type: dto.type,
            active: dto.active,
            stages: dto.stages,
            boosters: dto.boosters,
            costPerLaunch: dto.costPerLaunch,
            successRatePct: dto.successRatePct,
            firstFlight: dto.firstFlight?.date(.apiDay),
            country: dto.country,
            company: dto.company,
            wikipedia: dto.wikipedia,
            description: dto.description,
            firstStage: dto.firstStage.map(Stage.init(from:)),
            secondStage: dto.secondStage.map(Stage.init(from:)),
            height: dto.height.map(Models.Measurement.init(from:)),
            diameter: dto.diameter.map(Models.Measurement.init(from:)),
            mass: dto.mass.map(Mass.init(from:)),
            landingLegs: dto.landingLegs.map(LandingLegs.init(from:)),
            flickrImages: dto.flickrImages,
            payloadWeights: dto.payloadWeights?.map(PayloadWeight.init(from:)),
            engines: dto.engines.map(Engine.init(from:))
        )
    }
}
