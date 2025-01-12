//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct CompositeFairing: Equatable {
    public let height: Measurement?
    public let diameter: Measurement?

    public init(height: Measurement?, diameter: Measurement?) {
        self.height = height
        self.diameter = diameter
    }
}
