//
//  Collection+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 22.03.2022.
//  Copyright © 2022 Kokteyl.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
