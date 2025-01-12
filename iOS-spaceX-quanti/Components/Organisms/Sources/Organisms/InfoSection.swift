//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Style
import Atoms

public struct InfoSection<Content: View>: View {
    @Environment(\.style) private var style

    private let title: String

    @ViewBuilder private var content: () -> Content

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: style.offsets.medium
        ) {
            TextView(title, type: .headline2)
                .foregroundStyle(style.colors.foregroundsPrimary)
                .padding(.horizontal, style.offsets.medium)

            content()
        }
        .padding(style.offsets.medium)
        .background(style.colors.backgroundsSecondary)
        .clipShape(.rect(cornerRadius: style.offsets.extraLarge))
    }

    public init(
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
}
