// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Locs",
    products: [
        .library(
            name: "Locs",
            targets: ["Locs"])
    ],
    targets: [
        .target(
            name: "Locs"),
        .testTarget(
            name: "LocsTests",
            dependencies: ["Locs"]
        )
    ]
)
