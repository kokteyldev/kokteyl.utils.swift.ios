//
//  UIApplication+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var rootVC: UIWindow? {
        if let root = UIApplication.shared.windows.first {
            return root
        }
        
        return UIApplication.shared.keyWindow
    }
    
    static var safeAreaBottom: CGFloat {
        return rootVC?.safeAreaInsets.bottom ?? 0
    }
    
    class func topViewController(_ controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
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

