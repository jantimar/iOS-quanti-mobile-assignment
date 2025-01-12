//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct CompositeFairingDto: Codable {
    let height: MeasurementDto?
    let diameter: MeasurementDto?
}

extension CompositeFairing {
    init(from dto: CompositeFairingDto) {
        self.init(
            height: dto.height.map(Measurement.init(from:)),
            diameter: dto.diameter.map(Measurement.init(from:))
        )
    }
}
