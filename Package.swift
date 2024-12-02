// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLeetCode",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftLeetCode",
            targets: ["SwiftLeetCode"]),
    ],
    dependencies: [
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.8.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftLeetCode"),
        .testTarget(
            name: "SwiftLeetCodeTests",
            dependencies: ["SwiftLeetCode", "SwiftCheck"],
            resources: [
                .process("Fixtures/")
            ]
        ),
    ]
)
