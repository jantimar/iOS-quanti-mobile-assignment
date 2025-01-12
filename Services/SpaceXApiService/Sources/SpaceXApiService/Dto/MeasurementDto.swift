//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct MeasurementDto: Codable {
    let meters: Double?
    let feet: Double?
}

extension Models.Measurement {
    init(from dto: MeasurementDto) {
        self.init(meters: dto.meters, feet: dto.feet)
    }
}
