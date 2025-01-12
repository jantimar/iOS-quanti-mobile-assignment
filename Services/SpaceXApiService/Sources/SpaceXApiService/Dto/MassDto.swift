//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct MassDto: Codable {
    enum CodingKeys: String, CodingKey {
        case kilograms = "kg"
        case pounds = "lb"
    }

    let kilograms: Double
    let pounds: Double
}

extension Mass {
    init(from dto: MassDto) {
        self.init(kilograms: dto.kilograms, pounds: dto.pounds)
    }
}
