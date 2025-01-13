//
//  RocketDetailView.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 11.01.2025.
//

import SwiftUI
import ComposableArchitecture
import Models
import Locs
import Templates
import Style
import Atoms
import Utils
import Organisms
import Molecules

struct RocketDetailView: View {

    @Environment(\.style) private var style
    @Bindable var store: StoreOf<RocketDetailFeature>

    var body: some View {
        let rocket = store.state.rocket

        TableView(
            spacing: style.offsets.extraLarge,
            backgroundColor: style.colors.backgroundsPrimary
        ) {
            overview(rocket: rocket)
                .padding(.horizontal, style.offsets.medium)

            parameters(rocket: rocket)
                .padding(.horizontal, style.offsets.medium)

            stage(localize(.rocketDetailFirstStage), stage: rocket.firstStage)
                .padding(.horizontal, style.offsets.medium)

            stage(localize(.rocketDetailSecondStage), stage: rocket.secondStage)
                .padding(.horizontal, style.offsets.medium)

            photos(rocket: rocket)
                .padding(.horizontal, style.offsets.medium)

            Spacer()
        }
        .background(style.colors.backgroundsPrimary)
        .navigationTitle(rocket.name ?? "")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(localize(.rocketDetailBarButton)) { store.send(.launch) }
            }
        }
    }

    @ViewBuilder
    private func overview(rocket: Rocket) -> some View {
        if let description = rocket.description {
            TextView(.rocketDetailOverview, type: .headline2)
                .foregroundStyle(style.colors.foregroundsPrimary)

            TextView(description, type: .medium)
                .foregroundStyle(style.colors.foregroundsPrimary)
        }
    }

    @ViewBuilder
    private func parameters(rocket: Rocket) -> some View {
        let items: [(key: LocKey, value: String?)] = [
            (.rocketDetailHeight, rocket.height?.formatted()),
            (.rocketDetailDiameter, rocket.diameter?.formatted()),
            (.rocketDetailMass, rocket.mass?.formatted())
        ]
            .filter { $0.value != nil }

        if items.count > 0 {
            TextView(.rocketDetailParameters, type: .headline2)
                .foregroundStyle(style.colors.foregroundsPrimary)

            HStack(spacing: style.offsets.extraLarge) {
                ForEach(items, id: \.key) { item in
                    ParameterView(
                        title: localize(item.key),
                        value: item.value
                    )
                }

            }
            .frame(height: 110)
        }
    }

    @ViewBuilder
    private func stage(_ title: String, stage: Stage?) -> some View {
        if let stage = stage {
            InfoSection(title: title) {
                InfoRow(icon: .reusable, value: stage.reusableFormatted())
                InfoRow(icon: .engine, value: stage.enginesCountFormatted())
                InfoRow(icon: .fuel, value: stage.fuelFormatted())
                InfoRow(icon: .burn, value: stage.burnTimeFormatted())
            }
        }
    }

    @ViewBuilder
    private func photos(rocket: Rocket) -> some View {
        if let photos = rocket.flickrImages, photos.count > 0 {
            TextView(.rocketDetailPhotos, type: .headline2)
                .foregroundStyle(style.colors.foregroundsPrimary)

            ForEach(photos, id: \.self) { photo in
                CachedImage(url: URL(string: photo))
                    .clipShape(.rect(cornerRadius: style.offsets.extraLarge))
            }
        }
    }
}

extension Stage {
    func reusableFormatted() -> String {
        guard let reusable = reusable else { return "-" }
        return localize(reusable ? .rocketDetailReusable : .rocketDetailNonReusable)
    }

    func enginesCountFormatted() -> String {
        guard let engines = engines else { return "-" }
        return localize(.rocketDetailEngine, engines)
    }

    func fuelFormatted() -> String {
        guard let fuelAmongTons = fuelAmongTons else { return "-" }
        return localize(.rocketDetailFuel, fuelAmongTons)
    }

    func burnTimeFormatted() -> String {
        guard let burnTimeSec = burnTimeSec else { return "-" }
        return localize(.rocketDetailBurn, burnTimeSec)
    }
}
