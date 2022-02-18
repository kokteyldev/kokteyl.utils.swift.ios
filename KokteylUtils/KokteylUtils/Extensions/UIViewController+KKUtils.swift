//
//  UIViewController+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl. All rights reserved.
//

import UIKit

extension UIViewController {
    static func topMostVC() -> UIViewController? {
        return UIApplication.rootWindow?.rootViewController?.topMostViewController()
    }
    
    private func topMostViewController() -> UIViewController {
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        } else {
            for view in self.view.subviews
            {
                if let subViewController = view.next {
                    if subViewController is UIViewController {
                        let viewController = subViewController as! UIViewController
                        return viewController.topMostViewController()
                    }
                }
            }
            return self
        }
    }
    
    func share(_ file: AnyObject) {
        let filesToShare = [ file ]
        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
