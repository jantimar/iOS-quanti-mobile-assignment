//
//  File.swift
//  Organisms
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Style
import Atoms
import Locs

public struct RocketRow: View {
    @Environment(\.style) private var style

    private let title: String?
    private let firstFlight: String?
    private let separator: Bool

    private let action: () -> Void

    public var body: some View {
        Button(
            action: action,
            label: {
                VStack(spacing: 0) {
                    HStack(alignment: .center, spacing: style.offsets.medium) {
                        Icon(.rocket)
                            .frame(width: 32, height: 32)

                        VStack(alignment: .leading, spacing: style.offsets.small) {
                            TextView(title, type: .headline2)
                                .foregroundStyle(style.colors.foregroundsPrimary)

                            TextView(localize(.rocketsListFirstFlight, firstFlight ?? "-"), type: .small)
                                .foregroundStyle(style.colors.foregroundsTertiary)
                        }

                        Spacer()
                        Icon(.arrowRight, state: .disabled)
                    }
                    .padding(.horizontal, style.offsets.medium)
                    .frame(height: 52)

                    if separator {
                        Separator()
                            .padding(.leading, style.offsets.medium)
                    }
                }
            }
        )
    }

    public init(
        title: String?,
        firstFlight: String?,
        separator: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.firstFlight = firstFlight
        self.separator = separator
        self.action = action
    }
}
