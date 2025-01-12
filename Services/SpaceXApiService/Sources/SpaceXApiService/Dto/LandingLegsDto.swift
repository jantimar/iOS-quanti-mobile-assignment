//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct LandingLegsDto: Codable {
    let number: Int?
    let material: String?
}

extension LandingLegs {
    init(from dto: LandingLegsDto) {
        self.init(number: dto.number, material: dto.material)
    }
}
