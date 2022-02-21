//
//  KKUILabel.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 21.02.2022.
//

import UIKit

final public class KKUILabel: UILabel {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
