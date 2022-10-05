// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFFmpeg",
  platforms: [.macOS(.v11)],
  products: [
    .library(
      name: "SwiftFFmpeg",
      targets: ["SwiftFFmpeg"]
    )
  ],
  targets: [
    .target(
      name: "SwiftFFmpeg",
      dependencies: ["CFFmpeg"]
    ),
    .target(
      name: "CFFmpeg",
      dependencies: [
        "libavcodec",
        "libavdevice",
        "libavfilter",
        "libavformat",
        "libavutil",
        "libswresample",
        "libswscale",
      ],
      linkerSettings: [
        .linkedLibrary("z"),
        .linkedLibrary("bz2"),
        .linkedLibrary("iconv"),
        .linkedLibrary("lzma"),
        .linkedFramework("Security"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("VideoToolbox"),
        .linkedFramework("OpenGL"),
        .linkedFramework("CoreImage"),
        .linkedFramework("AppKit"),
      ]
    ),
    .binaryTarget(
      name: "libavcodec",
      path: "xcframework/libavcodec.zip"
    ),
    .binaryTarget(
      name: "libavdevice",
      path: "xcframework/libavdevice.zip"
    ),
    .binaryTarget(
      name: "libavfilter",
      path: "xcframework/libavfilter.zip"
    ),
    .binaryTarget(
      name: "libavformat",
      path: "xcframework/libavformat.zip"
    ),
    .binaryTarget(
      name: "libavutil",
      path: "xcframework/libavutil.zip"
    ),
    .binaryTarget(
      name: "libswresample",
      path: "xcframework/libswresample.zip"
    ),
    .binaryTarget(
      name: "libswscale",
      path: "xcframework/libswscale.zip"
    ),
    .target(
      name: "SwiftFFmpegExamples",
      dependencies: ["SwiftFFmpeg"]
    ),
    .testTarget(
      name: "SwiftFFmpegTests",
      dependencies: ["SwiftFFmpeg"]
    ),
  ]
)
