//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct PayloadWeightDto: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case kilograms = "kg"
        case pounds = "lb"
    }

    let id: String
    let name: String?
    let kilograms: Double?
    let pounds: Double?
}

extension PayloadWeight {
    init (from dto: PayloadWeightDto) {
        self.init(
            id: dto.id,
            name: dto.name,
            kilograms: dto.kilograms,
            pounds: dto.pounds
        )
    }
}
