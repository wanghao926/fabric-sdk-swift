import PackageDescription

let package = Package(
    name: "fabric-sdk-swift",
    dependencies: [
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(0,9,27)),
        .Package(url: "https://github.com/grpc/grpc-swift.git", Version(0,1,8))
    ]
)
