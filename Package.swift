import PackageDescription

let package = Package(
    name: "DVNTAlertManager",
    platforms: [
           .iOS(.v9), .iOS(.v10), .iOS(.v11), .iOS(.v12), .iOS(.v13)
    ],
    products: [
        .library(name: "DVNTAlertManager", type: .static, targets: ["DVNTAlertManager"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DVNTAlertManager",
            dependencies: [],
            path: "Sources",
            exclude: []
        )
    ]
)
