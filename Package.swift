// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "PennyGitHub",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
//        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc"),
        .package(url: "https://github.com/loganwright/penny-api.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "PennyGitHub", dependencies: ["Vapor", "PennyConnector", "Penny"]),
        .target(name: "PennyGitHubRun", dependencies: ["PennyGitHub"]),
        .testTarget(name: "PennyGitHubTests", dependencies: ["PennyGitHub"])
    ]
)

