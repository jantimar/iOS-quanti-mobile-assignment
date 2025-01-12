//
//  File.swift
//  Organisms
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Style
import Atoms

public struct ParameterView: View {
    @Environment(\.style) private var style

    private let title: String?
    private let value: String?

    public var body: some View {
        ZStack {
            style.colors.iconsPrimary

            VStack(spacing: style.offsets.medium) {
                TextView(title, type: .headline1)
                    .foregroundStyle(style.colors.foregroundsSecondary)

                TextView(value, type: .medium)
                    .foregroundStyle(style.colors.foregroundsSecondary)

            }
        }
        .clipShape(.rect(cornerRadius: style.offsets.extraLarge))
    }

    public init(title: String?, value: String?) {
        self.title = title
        self.value = value
    }
}
