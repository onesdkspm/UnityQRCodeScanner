// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityQRCodeScanner",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityQRCodeScanner",
            targets: ["UnityQRCodeScannerWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTQRCode.git", branch: "develop"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityQRCodeScannerWrapper",
            dependencies: [
                .byName(name: "UnityQRCodeScanner"),
                .product(name: "UnityBridge", package: "UnityBridge"),
                .product(name: "BTQRCode", package: "BTQRCode"),
            ],
            path: "UnityQRCodeScannerWrapper",
            linkerSettings: [
                // iOS 系统框架
                .linkedFramework("UIKit"),
                .linkedFramework("AVFoundation"),
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityQRCodeScanner",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQRCodeScanner/1.1.0-dev-1474713/UnityQRCodeScanner.xcframework.zip",
            checksum: "2524eb903fc5790c66e1a924133dca6b3e095d32ef5c21b9d3588bbb6252b1f3"
        )
    ]
)
