//
//  UITabBar+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import UIKit

extension UITabBar {
    func setTabBarUI() {
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            standardAppearance = appearance;
            scrollEdgeAppearance = appearance
        }
    }
}
