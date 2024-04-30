// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Stubs",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Stubs",
            targets: ["Stubs", "StubsTests", "StubsUITests"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Stubs",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "StubsTests",
            dependencies: ["Stubs"],
            path: "Tests"),
    ]
    
)
