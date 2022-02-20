//
//  UILabel+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

extension UILabel {
    @IBInspectable public var localizedKey: String? {
        get {
            return text
        }
        set {
            text = NSLocalizedString(newValue ?? "", comment: "")
        }
    }

}
