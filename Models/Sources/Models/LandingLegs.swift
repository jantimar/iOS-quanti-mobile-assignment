//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct LandingLegs: Equatable {
    public let number: Int?
    public let material: String?

    public init(number: Int?, material: String?) {
        self.number = number
        self.material = material
    }
}
