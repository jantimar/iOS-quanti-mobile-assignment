//
//  File.swift
//  Models
//
//  Created by Jan Timar on 12.01.2025.
//

import Foundation

public struct Payloads: Equatable {
    public let compositeFairing: CompositeFairing?
    public let option: String?

    public init(compositeFairing: CompositeFairing?, option: String?) {
        self.compositeFairing = compositeFairing
        self.option = option
    }
}
