// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "AlchemySwift",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AlchemySwift",
            targets: ["AlchemySwift"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/SirWellington/alchemytest",
            branch :"develop"
        ),
        .package(
            url: "https://github.com/SirWellington/alchemygenerator",
            branch :"develop"
        )
    ],
    targets: [
        .target(
            name: "AlchemySwift",
            dependencies: []
        ),
        .testTarget(
            name: "AlchemySwiftTests",
            dependencies: [
                "AlchemySwift",
                .product(
                    name: "AlchemyGenerator",
                    package: "alchemygenerator"
                ),
                .product(
                    name: "AlchemyTest",
                    package: "alchemytest"
                )
            ]
        ),
    ]
)
