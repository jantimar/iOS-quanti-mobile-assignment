//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Style
import Molecules

public struct TableView<Content: View>: View {

    @Environment(\.style) private var style
    @ViewBuilder private var content: () -> Content

    private let backgroundColor: Color?
    private let spacing: CGFloat

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(
                alignment: .leading,
                spacing: spacing,
                content: content
            )
            .padding(.vertical, style.offsets.medium)
            .background(backgroundColor ?? style.colors.backgroundsPrimary)
            .clipShape(.rect(cornerRadius: style.offsets.extraLarge))
            .padding(style.offsets.medium)

            Spacer()
        }
    }

    public init(
        spacing: CGFloat = 0,
        backgroundColor: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.spacing = spacing
        self.backgroundColor = backgroundColor
        self.content = content
    }
}
