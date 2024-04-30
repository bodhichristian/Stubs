// swift-tools-version: 5.9.0
import PackageDescription

let package = Package(
    name: "Stubs",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Stubs",
            targets: ["Stubs"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Stubs",
            dependencies: [],
            path: "Sources/Stubs"),
        .testTarget(
            name: "StubsTests",
            dependencies: ["Stubs"],
            path: "Tests"),
    ]
    
)
