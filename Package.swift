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
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTQRCode.git", from: "2.0.3"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQRCodeScanner/2.0.3-dev-1482672/UnityQRCodeScanner.xcframework.zip",
            checksum: "b553ab050a2e0d56fab56e93210e15172fa78e69e965cd53ef3547fd644e1127"
        )
    ]
)
