//
//  UIButton+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import UIKit

extension UIButton {
    
    @IBInspectable public var localizedKey: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue?.localized ?? "", for: .normal)
            setTitle(newValue?.localized ?? "", for: .selected)
            setTitle(newValue?.localized ?? "", for: .highlighted)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var isCirclular: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            if newValue == true {
                layer.masksToBounds = true
                layer.cornerRadius = bounds.height/2
            }
        }
    }
    
    @IBInspectable var isActive: Bool {
        get {
            return isUserInteractionEnabled
        }
        set {
            isUserInteractionEnabled = newValue
            if newValue == true {
                alpha = 1.0
            } else {
                alpha = 0.5
            }
        }
    }
    func underline() {
        let states: [UIControl.State] = [.normal, .selected, .highlighted]
        
        for state in states {
            if let text = self.title(for: state) {
                let attributedString = NSMutableAttributedString(string: text)
                let titleColor = self.titleColor(for: state)
                
                attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: titleColor!, range: NSRange(location: 0, length: text.count))
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor!, range: NSRange(location: 0, length: text.count))
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
                self.setAttributedTitle(attributedString, for: state)
            }
        }
    }
}
