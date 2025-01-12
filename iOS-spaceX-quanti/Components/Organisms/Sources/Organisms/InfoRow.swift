//
//  File.swift
//  Organisms
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Style
import Atoms

public struct InfoRow: View {
    @Environment(\.style) private var style

    private let icon: IconType
    private let value: String?

    public var body: some View {
        HStack(alignment: .center, spacing: style.offsets.medium) {
            Icon(icon)
                .frame(width: 24, height: 24)

            TextView(value, type: .medium)
                .foregroundStyle(style.colors.foregroundsPrimary)

            Spacer()
        }
        .padding(.horizontal, style.offsets.medium)
        .frame(height: 44)
    }

    public init(icon: IconType, value: String?) {
        self.icon = icon
        self.value = value
    }
}
