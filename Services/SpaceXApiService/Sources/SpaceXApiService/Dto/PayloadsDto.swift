//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct PayloadsDto: Codable {
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }

    let compositeFairing: CompositeFairingDto?
    let option1: String?
}

extension Payloads {
    init(from dto: PayloadsDto) {
        self.init(
            compositeFairing: dto.compositeFairing.map(CompositeFairing.init(from:)),
            option: dto.option1
        )
    }
}
