//
//  RootView.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 14.01.2025.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {

    @Environment(\.style) private var style
    @Bindable var store: StoreOf<RootFeature>

    var body: some View {
        NavigationStack(
            path: $store.scope(
                state: \.path,
                action: \.path
            ),
            root: {
                RocketListView(store: store.scope(
                    state: \.root,
                    action: \.root
                ))
            },
            destination: { store in
                switch store.case {
                case let .showRocket(store):
                    RocketDetailView(store: store)
                case let .showLaunchRocket(store):
                    RocketLaunchView(store: store)
                }
            }
        )
        .tint(style.colors.iconsPrimary)
    }
}
