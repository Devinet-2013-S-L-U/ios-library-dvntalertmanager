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
        .package(url: "https://bitbucket.org/Devinet_Team/ios-library-dvntstringextension", from: "1.0.6"),
        .package(url: "https://bitbucket.org/Devinet_Team/ios-library-dvntuiwindowextension", from: "1.0.6"),
    ],
    targets: [
        .target(
            name: "DVNTAlertManager",
            dependencies: [])
    ]
)
