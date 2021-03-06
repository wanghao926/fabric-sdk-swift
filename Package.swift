import PackageDescription

let package = Package(
    name: "fabric-sdk-swift",
    targets: [
        Target(name: "Hfc",
           dependencies: ["Protos"])
    ],
    dependencies: [
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(0,9,28)),
        .Package(url: "https://github.com/grpc/grpc-swift.git", Version(0,1,10))
    ]
)

products.append(
    Product(
        name: "SwiftHFC",
        type: .Library(.Dynamic),
        modules: [
            "Hfc",
            "Protos"
        ]
    )
)
