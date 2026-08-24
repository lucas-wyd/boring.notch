// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "BoringNotchFeatures",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "CodexNotificationsCore", targets: ["CodexNotificationsCore"]),
        .library(name: "DailyPlanningCore", targets: ["DailyPlanningCore"]),
    ],
    targets: [
        .target(
            name: "CodexHookTrustState",
            path: "BoringNotchXPCHelper",
            sources: ["CodexHookTrustState.swift"]
        ),
        .target(
            name: "CodexHookSupport",
            path: "BoringNotchXPCHelper",
            sources: ["CodexHookAuthenticator.swift", "CodexHookConfiguration.swift"]
        ),
        .target(
            name: "CodexNotificationsCore",
            path: "boringNotch/features/CodexNotifications/Core"
        ),
        .target(
            name: "DailyPlanningCore",
            path: "boringNotch/features/DailyPlanning/Core"
        ),
        .testTarget(
            name: "BoringNotchFeatureTests",
            dependencies: [
                "CodexNotificationsCore",
                "CodexHookSupport",
                "CodexHookTrustState",
                "DailyPlanningCore",
            ],
            path: "boringNotchTests"
        ),
    ]
)
