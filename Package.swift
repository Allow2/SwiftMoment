// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "SwiftMoment",
	products: [
	    .library(name: "SwiftMoment", dependencies: ["SwiftMoment"])
	],
	dependencies: [],
	targets: [
	    .target(name: "SwiftMoment", dependencies: [], path: "Sources/SwiftMoment")
	]
)
