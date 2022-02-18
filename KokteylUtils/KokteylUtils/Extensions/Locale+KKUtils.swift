//
//  Locale+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import Foundation

extension Locale {
    static func locale(from currencyCode: String?) -> Locale {
        guard let currencyCode = currencyCode else {
            return Locale.current
        }
        
        for localId in Locale.availableIdentifiers {
            let locale = Locale(identifier: localId)
            
            if locale.currencyCode == currencyCode {
                return locale
            }
        }
        
        return Locale.current
    }
}
