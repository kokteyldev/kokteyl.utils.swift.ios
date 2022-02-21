//
//  UITextField+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

public extension UITextField {
    @IBInspectable var localizedKey: String? {
        get {
            return text
        }
        set {
            text = NSLocalizedString(newValue ?? "", comment: "")
        }
    }
    
    func setupPasswordButton(_ image: UIImage?) {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.showPasswordTapped), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func showPasswordTapped(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
}
