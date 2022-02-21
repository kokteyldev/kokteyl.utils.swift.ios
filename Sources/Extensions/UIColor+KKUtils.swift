//
//  UIColor+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

public extension UIColor {
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        let r, g, b: CGFloat
        
        var start = hexString.index(hexString.startIndex, offsetBy: 0)
        if hexString.hasPrefix("#") {
            start = hexString.index(hexString.startIndex, offsetBy: 1)
        }
        
        let hexColor = String(hexString[start...])
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                
                self.init(red: r, green: g, blue: b, alpha: alpha)
                return
            }
        }
        
        return nil
    }
}
