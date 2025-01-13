//
//  Locs.swift
//  Locs
//
//  Created by Jan Timar on 02.01.2025.
//

import Foundation

public enum LocKey: String {
    // Rockets list
    case rocketsListTitle = "rockets.list.title"
    case rocketsListFirstFlight = "rockets.list.first_flight"

    // Rocket detail
    case rocketDetailOverview = "rocket.detail.overview"
    case rocketDetailParameters = "rocket.detail.parameters"
    case rocketDetailFirstStage = "rocket.detail.first_stage"
    case rocketDetailSecondStage = "rocket.detail.second_stage"
    case rocketDetailPhotos = "rocket.detail.photos"

    case rocketDetailHeight = "rocket.detail.height"
    case rocketDetailDiameter = "rocket.detail.diameter"
    case rocketDetailMass = "rocket.detail.mass"

    case rocketDetailReusable = "rocket.detail.reusable"
    case rocketDetailNonReusable = "rocket.detail.non-reusable"
    case rocketDetailEngine = "rocket.detail.engine"
    case rocketDetailFuel = "rocket.detail.fuel"
    case rocketDetailBurn = "rocket.detail.burn"

    case rocketDetailBarButton = "rocket.detail.bar_button.title"

    // Rocket launch
    case rocketLaunchTitle = "rocket.launch.title"
    case rocketLaunchMessageFlying = "rocket.launch.message.flying"
    case rocketLaunchMessageIdle = "rocket.launch.message.idle"

    // Errors
    case errorNoRockets = "error.no_rockets"
    case errorNetwork = "error.network"
    case errorRetry = "error.retry"
}

extension LocKey {
    func localized(comment: String = "", _ params: CVarArg...) -> String {
        String(format: NSLocalizedString(rawValue, comment: comment), params)
    }
}

public func localize(
    _ key: LocKey,
    comment: String = "",
    _ params: CVarArg...
) -> String {
    key.localized(comment: comment, params)
}
