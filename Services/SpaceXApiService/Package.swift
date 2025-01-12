// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpaceXApiService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SpaceXApiService",
            targets: ["SpaceXApiService"])
    ],
    dependencies: [
        .package(name: "APIService", path: "APIService"),
        .package(name: "Models", path: "../Models"),
        .package(name: "Utils", path: "../Utils")
    ],
    targets: [
        .target(
            name: "SpaceXApiService",
            dependencies: ["Models", "Utils", "APIService"]
        ),
        .testTarget(
            name: "SpaceXApiServiceTests",
            dependencies: ["SpaceXApiService"]
        )
    ]
)
