// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

import PackageDescription

let package = Package(
  name: "Tokamak",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
    // Products define the executables and libraries produced by a package,
    // and make them visible to other packages.
    .executable(
      name: "TokamakDemo",
      targets: ["TokamakDemo"]
    ),
    .library(
      name: "TokamakDOM",
      targets: ["TokamakDOM"]
    ),
    .library(
      name: "TokamakTestRenderer",
      targets: ["TokamakTestRenderer"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/MaxDesiatov/JavaScriptKit.git", .revision("d670953")),
    .package(url: "https://github.com/MaxDesiatov/Runtime.git", .branch("wasi-build")),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define
    // a module or a test suite.
    // Targets can depend on other targets in this package, and on products
    // in packages which this package depends on.
    .target(
      name: "Tokamak",
      dependencies: ["Runtime"]
    ),
    .target(
      name: "TokamakDemo",
      dependencies: ["JavaScriptKit", "Tokamak", "TokamakDOM"]
    ),
    .target(
      name: "TokamakDOM",
      dependencies: ["JavaScriptKit", "Tokamak"]
    ),
    .target(
      name: "TokamakTestRenderer",
      dependencies: ["Tokamak"]
    ),
    .testTarget(
      name: "TokamakTests",
      dependencies: ["TokamakDemo", "TokamakTestRenderer"]
    ),
  ]
)
