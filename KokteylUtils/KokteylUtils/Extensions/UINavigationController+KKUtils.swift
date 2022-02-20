//
//  UINavigationController+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

extension UINavigationController {
    func setNavigationBarTransparent(_ isTransparent: Bool) {
        if isTransparent {
            if #available(iOS 15.0, *) {
                navigationController?.navigationBar.scrollEdgeAppearance = nil
            } else {
                navigationBar.setBackgroundImage(UIImage(), for:.default)
                navigationBar.isTranslucent = true
                navigationBar.shadowImage = UIImage()
            }
        } else {
            if #available(iOS 15.0, *) {
                navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            } else {
                navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:.default)
                navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
                navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
            }
        }
    }
}


