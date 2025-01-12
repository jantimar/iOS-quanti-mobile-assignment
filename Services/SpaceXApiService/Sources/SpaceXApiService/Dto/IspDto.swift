//
//  File.swift
//  SpaceXApiService
//
//  Created by Jan Timar on 11.01.2025.
//

import Foundation
import Models

struct IspDto: Codable {
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }

    let seaLevel: Double?
    let vacuum: Double?
}

extension Isp {
    init(from dto: IspDto) {
        self.init(seaLevel: dto.seaLevel, vacuum: dto.vacuum)
    }
}
