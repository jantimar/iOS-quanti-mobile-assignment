//
//  File.swift
//  Models
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation

public struct Rocket: Equatable {
    public let id: String
    public let name: String?
    public let type: String?
    public let active: Bool?
    public let stages: Int?
    public let boosters: Int?
    public let costPerLaunch: Int?
    public let successRatePct: Double?
    public let firstFlight: Date?
    public let country: String?
    public let company: String?
    public let wikipedia: String?
    public let description: String?
    public let firstStage: Stage?
    public let secondStage: Stage?
    public let height: Measurement?
    public let diameter: Measurement?
    public let mass: Mass?
    public let landingLegs: LandingLegs?
    public let flickrImages: [String]?
    public let payloadWeights: [PayloadWeight]?
    public let engines: Engine?

    public init(
        id: String,
        name: String?,
        type: String?,
        active: Bool?,
        stages: Int?,
        boosters: Int?,
        costPerLaunch: Int?,
        successRatePct: Double?,
        firstFlight: Date?,
        country: String?,
        company: String?,
        wikipedia: String?,
        description: String?,
        firstStage: Stage?,
        secondStage: Stage?,
        height: Measurement?,
        diameter: Measurement?,
        mass: Mass?,
        landingLegs: LandingLegs?,
        flickrImages: [String]?,
        payloadWeights: [PayloadWeight]?,
        engines: Engine?
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.active = active
        self.stages = stages
        self.boosters = boosters
        self.costPerLaunch = costPerLaunch
        self.successRatePct = successRatePct
        self.firstFlight = firstFlight
        self.country = country
        self.company = company
        self.wikipedia = wikipedia
        self.description = description
        self.firstStage = firstStage
        self.secondStage = secondStage
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.landingLegs = landingLegs
        self.flickrImages = flickrImages
        self.payloadWeights = payloadWeights
        self.engines = engines
    }
}
