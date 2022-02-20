//
//  UIApplication+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

extension UIApplication {
    static var rootWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
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

