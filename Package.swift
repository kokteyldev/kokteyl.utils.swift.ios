// swift-tools-version:5.5
//
//  Package.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import PackageDescription

let package = Package(name: "KokteylUtils-Swift",
                      platforms: [.iOS(.v11)],
                      products: [.library(name: "KokteylUtils",
                                          targets: ["KokteylUtils"])],
                      targets: [.target(name: "KokteylUtils",
                                        path: "KokteylUtils/KokteylUtils",
                                        exclude: ["Info.plist"]),
                                .testTarget(name: "KokteylUtilsTests",
                                            dependencies: ["KokteylUtils"],
                                            path: "KokteylUtils/Tests",
                                            exclude: ["Info.plist"])],
                      swiftLanguageVersions: [.v5])
