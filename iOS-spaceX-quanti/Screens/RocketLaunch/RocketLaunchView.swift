//
//  RocketLaunchView.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import SwiftUI
import ComposableArchitecture
import Style
import Atoms
import Locs

struct RocketLaunchView: View {

    @Environment(\.style) private var style
    let store: StoreOf<RocketLaunchFeature>

    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .center, spacing: style.offsets.medium) {
                Spacer()

                Image(type: store.state.started ? .rocketFlying : .rocketIdle)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 200)

                    .keyframeAnimator(
                        initialValue: RocketAnimation(),
                        trigger: store.state.started,
                        content: { content, value in
                            content
                                .offset(y: value.offset)
                        },
                        keyframes: { _ in
                            KeyframeTrack(\.offset) {
                                CubicKeyframe(-reader.size.height, duration: 1.2)
                            }
                        }
                    )

                TextView(
                    store.state.started ? .rocketLaunchMessageFlying : .rocketLaunchMessageIdle
                )

                // TODO: Change trigger to motion manager
                Button("Start") {
                    store.send(.start)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .navigationTitle(localize(.rocketLaunchTitle))
        }
    }
}

private struct RocketAnimation {
    var offset: CGFloat = 0
}
