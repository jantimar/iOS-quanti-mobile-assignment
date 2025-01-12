//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Style

public enum ImageType: String {
    case rocketError
}

extension Image {
    public init(type: ImageType) {
        self.init(type.rawValue)
    }
}
