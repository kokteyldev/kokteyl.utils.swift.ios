//
//  UIApplication+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

public extension UIApplication {
    static var rootWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    static var safeAreaBottom: CGFloat {
        return rootWindow?.safeAreaInsets.bottom ?? 0
    }
    
    class func topViewController(_ controller: UIViewController? = UIApplication.rootWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        
        return controller
    }
}

