// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DVNTAlertManager",
    defaultLocalization: "en",
    products: [
        .library(
            name: "DVNTAlertManager",
            targets: ["DVNTAlertManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Devinet-2013-S-L-U/ios-library-dvntstringextension.git", from: "1.1.5"),
        .package(url: "https://github.com/Devinet-2013-S-L-U/ios-library-dvntuiwindowextension.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "DVNTAlertManager",
            dependencies: [
                .productItem(name: "DVNTStringExtension", package: "ios-library-dvntstringextension", condition: .none),
                .productItem(name: "DVNTUIWindowExtension", package: "ios-library-dvntuiwindowextension", condition: .none)
            ],
            resources: [.process("Assets/Translations")])
    ]
)
