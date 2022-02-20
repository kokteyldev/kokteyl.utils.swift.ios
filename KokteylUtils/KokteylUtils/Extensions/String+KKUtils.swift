//
//  String+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import Foundation

extension String {
    
    // MARK: - Localization
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    // MARK: - Config
    var configValue: String? {
        return (Bundle.main.infoDictionary?[self] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    func versionCompare(_ otherVersion: String) -> ComparisonResult {
        return self.compare(otherVersion, options: .numeric)
    }
    
    // MARK: - Validation
    var isNumeric: Bool {
        return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPhoneNumber: Bool {
        let phoneRegEx = "^\\+[1-9]\\d{1,14}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: self)
    }
    
    var isEmpty: Bool {
        return self == ""
    }
    
    var isValidNumber: Bool {
        return self != "0" && self[self.startIndex] != "0"
    }
    
    var isValidTCKN: Bool {
        return self.count == 11
    }
    
    // MARK: - Substring
    var length: Int {
        return count
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
}
