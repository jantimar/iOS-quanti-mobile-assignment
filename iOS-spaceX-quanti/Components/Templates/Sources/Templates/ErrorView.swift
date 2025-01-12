//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 12.01.2025.
//

import SwiftUI
import Atoms
import Style
import Locs

public struct ErrorView: View {
    @Environment(\.style) private var style

    private let text: String
    private let action: (() -> Void)?

    public var body: some View {
        VStack(alignment: .center, spacing: style.offsets.medium) {
            Spacer()

            Image(type: .rocketError)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(style.colors.iconsPrimary)
                .clipShape(.circle)
                .padding(.horizontal, 100)
                .padding(.vertical, style.offsets.extraLarge)

            TextView(text, type: .large)
                .foregroundStyle(style.colors.foregroundsTertiary)

            if let action = action {
                Button(action: action) {
                    TextView(.errorRetry, type: .large)
                        .foregroundStyle(style.colors.accentPrimary)
                }
            }

            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(style.colors.backgroundsSecondary)
    }

    public init(
        text: String,
        action: (() -> Void)? = nil
    ) {
        self.text = text
        self.action = action
    }
}
