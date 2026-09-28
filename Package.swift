// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IconOven",
    platforms: [.iOS(.v15), .macOS(.v12), .tvOS(.v15), .watchOS(.v8), .visionOS(.v1)],
    products: [
        .library(name: "IconOven", targets: ["IconOven"]),
    ],
    targets: [
        .target(name: "IconOven", resources: [.process("Resources")]),
        .testTarget(name: "IconOvenTests", dependencies: ["IconOven"]),
    ]
)
