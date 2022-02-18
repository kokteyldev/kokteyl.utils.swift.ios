//
//  Error+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import Foundation

extension Error {
    public static func error(_ domain: String, message: String?, code: Int) -> Error {
        return NSError(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey : message ?? "error_unknown".localized])
    }
}
