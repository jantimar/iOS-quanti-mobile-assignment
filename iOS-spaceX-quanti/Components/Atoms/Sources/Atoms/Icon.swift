//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 28.12.2024.
//

import SwiftUI
import Style

public enum IconType {
    case rocket
    case burn
    case engine
    case fuel
    case reusable
    case arrowRight

    var name: String {
        switch self {
        case .rocket:
            return "rocket"
        case .arrowRight:
            return "chevron.right"
        case .burn:
            return "burn"
        case .engine:
            return "engine"
        case .fuel:
            return "fuel"
        case .reusable:
            return "reusable"
        }
    }

    var isSystem: Bool {
        switch self {
        case .arrowRight:
            return true
        default:
            return false
        }
    }

    fileprivate var image: Image {
        isSystem ? Image(systemName: name) : Image(name)
    }
}

public enum IconState {
    case `default`, disabled
}

public struct Icon: View {

    @Environment(\.style) private var style
    private let icon: IconType
    private let state: IconState

    private var color: Color {
        switch state {
        case .default:
            return style.colors.iconsPrimary
        case .disabled:
            return style.colors.iconsSecondary
        }
    }

    public var body: some View {
        icon.image
            .renderingMode(.template)
            .foregroundStyle(color)
    }

    public init(
        _ type: IconType,
        state: IconState = .default
    ) {
        self.icon = type
        self.state = state
    }
}
