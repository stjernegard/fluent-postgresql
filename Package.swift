// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "FluentPostgreSQL",
    products: [
        // Swift ORM for PostgreSQL (built on top of Fluent ORM framework)
        .library(name: "FluentPostgreSQL", targets: ["FluentPostgreSQL"]),
    ],
    dependencies: [
        // 🌎 Utility package containing tools for byte manipulation, Codable, OS APIs, and debugging.
        .package(url: "https://github.com/vapor/core.git", from: "3.0.0"),

        // Swift ORM framework (queries, models, and relations) for building NoSQL and SQL database integrations.
        .package(url: "https://github.com/vapor/fluent.git", from: "3.0.0"),

        // 🐘 Non-blocking, event-driven Swift client for PostgreSQL.
        .package(url: "https://github.com/stjernegard/postgresql.git", .branch("master")),
    ],
    targets: [
        .target(name: "FluentPostgreSQL", dependencies: ["Async", "FluentSQL", "PostgreSQL"]),
        .testTarget(name: "FluentPostgreSQLTests", dependencies: ["FluentBenchmark", "FluentPostgreSQL"]),
    ]
)
