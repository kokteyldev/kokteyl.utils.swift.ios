//
//  UIScrollView+KKUtils.swift
//  KokteylUtils
//
//  Created by Taha Tosun on 22.03.2022.
//

import UIKit

extension UIScrollView {
    
    public enum ScrollPosition {
        case top
        case middle
        case bottom
    }
    
    public func scrollToView(view: UIView, position: UIScrollView.ScrollPosition = .middle, animated: Bool) {
        if let origin = view.superview {
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            var height: CGFloat = 0
            
            switch position {
                case .top:
                    height = 0
                case .middle:
                    height = UIScreen.main.bounds.height/2.0
                case .bottom:
                    height = UIScreen.main.bounds.height
            }
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y-height, width: 1, height: self.frame.height), animated: animated)
        }
    }
}
