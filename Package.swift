// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iPhoneNumberField",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v4),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iPhoneNumberField",
            targets: ["iPhoneNumberField"]),
        .library(
            name: "NativeFont",  // Add this line
            targets: ["NativeFont"]),  // Add this line
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/marmelroy/PhoneNumberKit", .upToNextMajor(from: "3.4.5"))
    ],
    targets: [
        .target(
            name: "iPhoneNumberField",
            dependencies: ["PhoneNumberKit"]
        ),
        .target(
            name: "NativeFont",
            path: "Sources/NativeFont"  // Specify the path to the source files
        ),
    ]
)
