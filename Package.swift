// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DVNTAlertManager",
    products: [
        .library(
            name: "DVNTAlertManager",
            targets: ["DVNTAlertManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/material-components/material-components-ios", from: "92.3.1"),
    ],
    targets: [
        .target(
            name: "DVNTAlertManager",
            dependencies: [])
    ]
)
