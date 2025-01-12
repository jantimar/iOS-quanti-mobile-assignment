//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct ThrustDto: Codable {
    let kN: Double
    let lbf: Double
}

extension Thrust {
    init(from dto: ThrustDto) {
        self.init(kN: dto.kN, lbf: dto.lbf)
    }
}
