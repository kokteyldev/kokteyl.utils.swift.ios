//
//  Package.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//

import PackageDescription

let package = Package(name: "KokteylUtils-Swift",
                      platforms: [.macOS(.v11_1),
                                  .iOS(.v11)],
                      products: [.library(name: "KokteylUtils",
                                          targets: ["KokteylUtils"])],
                      targets: [.target(name: "KokteylUtils",
                                        path: "KokteylUtils",
                                        exclude: ["Info.plist"]],
                      swiftLanguageVersions: [.v5])
