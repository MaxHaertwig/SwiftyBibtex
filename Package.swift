// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyBibtex",
    products: [
        .library(name: "SwiftyBibtex", targets: ["SwiftyBibtex"])
    ],
    dependencies: [
        .package(name: "Antlr4", url: "https://github.com/MaxHaertwig/ANTLR4-Swift.git", .upToNextMinor(from: "4.9.0"))
    ],
    targets: [
        .target(name: "BibtexParser", dependencies: ["Antlr4"]),
        .target(name: "SwiftyBibtex", dependencies: ["BibtexParser"]),
        .testTarget(name: "SwiftyBibtexTests", dependencies: ["SwiftyBibtex"])
    ]
)
