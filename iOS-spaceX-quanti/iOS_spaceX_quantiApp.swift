//
//  iOS_spaceX_quantiApp.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct SpaceXQuantiApp: App {

    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootFeature.State(root: RocketListFeature.State()),
                    reducer: RootFeature.init
                )
            )
        }
    }
}
