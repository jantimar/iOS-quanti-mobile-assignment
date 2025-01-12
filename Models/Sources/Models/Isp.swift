//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Isp: Equatable {
    public let seaLevel: Double?
    public let vacuum: Double?

    public init(seaLevel: Double?, vacuum: Double?) {
        self.seaLevel = seaLevel
        self.vacuum = vacuum
    }
}
