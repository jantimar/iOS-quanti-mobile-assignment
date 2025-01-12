// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "APIService",
            targets: ["APIService"])
    ],
    targets: [
        .target(
            name: "APIService"),
        .testTarget(
            name: "APIServiceTests",
            dependencies: ["APIService"]
        )
    ]
)
