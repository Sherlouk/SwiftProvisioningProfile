// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyProvisioningProfile",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(
            name: "SwiftyProvisioningProfile",
            targets: ["SwiftyProvisioningProfile"]),
    ],
    targets: [
        .target(
            name: "SwiftyProvisioningProfile",
            dependencies: []),
        .testTarget(
            name: "SwiftyProvisioningProfileTests",
            dependencies: ["SwiftyProvisioningProfile"]),
    ]
)
