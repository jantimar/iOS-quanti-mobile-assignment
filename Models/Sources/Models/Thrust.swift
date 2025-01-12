//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Thrust: Equatable {
    public let kN: Double
    public let lbf: Double

    public init(kN: Double, lbf: Double) {
        self.kN = kN
        self.lbf = lbf
    }
}
