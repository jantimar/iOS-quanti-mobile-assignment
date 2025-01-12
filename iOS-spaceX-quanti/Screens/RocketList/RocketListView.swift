//
//  RocketListView.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import SwiftUI
import ComposableArchitecture
import Style
import Atoms
import Organisms
import Templates
import Locs
import Utils
import Models

struct RocketListView: View {

    @Environment(\.style) private var style
    @Bindable var store: StoreOf<RocketListFeature>

    var body: some View {
        NavigationStack(
            path: $store.scope(
                state: \.path,
                action: \.path
            ),
            root: {
                ZStack {
                    switch store.state.rockets {
                    case let .data(rockets) where rockets.count == 0:
                        ErrorView(
                            text: localize(.errorNoRockets),
                            action: { store.send(.refreshRockets) }
                        )
                    case let .data(rockets):
                        TableView {
                            ForEach(rockets, id: \.id) { rocket in
                                RocketRow(
                                    title: rocket.name,
                                    firstFlight: rocket.firstFlight?.string(.appDay),
                                    separator: rocket.id != rockets.last?.id,
                                    action: { store.send(.show(rocket: rocket)) }
                                )
                            }
                        }
                    case .loading:
                        ActivityIndicator()
                    case .failure:
                        ErrorView(
                            text: localize(.errorNetwork),
                            action: { store.send(.refreshRockets) }
                        )
                    case .unknown:
                        Color.clear
                            .onAppear { store.send(.refreshRockets) }
                    }
                }
                .background(style.colors.backgroundsSecondary)
                .navigationTitle(localize(.rocketsListTitle))
            },
            destination: { store in
                switch store.case {
                case let .showRocket(store):
                    RocketDetailView(store: store)
                }
            }
        )
        .tint(style.colors.iconsPrimary)
    }
}
