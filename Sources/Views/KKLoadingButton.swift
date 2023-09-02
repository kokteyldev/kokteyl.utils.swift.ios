//
//  KKLoadingButton.swift
//  KokteylUtils
//
//  Created by Taha Tosun on 22.03.2022.
//


import UIKit

public class KKLoadingButton: UIButton {

    var activityIndicator: UIActivityIndicatorView?

    enum IndicatorPosition {
        case left
        case middle
        case right
    }
    
    var indicatorPosition: IndicatorPosition = .middle

    @IBInspectable var indicatorColor: UIColor = .gray {
        didSet {
            activityIndicator?.color = indicatorColor
        }
    }

    func showLoading() {
        if activityIndicator == nil {
            activityIndicator = UIActivityIndicatorView()
            activityIndicator?.hidesWhenStopped = true
            activityIndicator?.color = indicatorColor
            
            self.addSubview(activityIndicator!)
            setupConstraints()
        }
        activityIndicator?.startAnimating()
        self.isEnabled = false
    }
    
    func hideLoading() {
        activityIndicator?.stopAnimating()
        self.isEnabled = true
    }
    
    private func setupConstraints() {
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        var horizontalConstraint: NSLayoutConstraint
        switch indicatorPosition {
        case .left:
            horizontalConstraint = NSLayoutConstraint(item: self.titleLabel ?? self, attribute: .leading, relatedBy: .equal, toItem: activityIndicator, attribute: .trailing, multiplier: 1, constant: 0)
        case .middle:
            horizontalConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        case .right:
            horizontalConstraint = NSLayoutConstraint(item: self.titleLabel ?? self, attribute: .trailing, relatedBy: .equal, toItem: activityIndicator, attribute: .leading, multiplier: 1, constant: 0)
        }
        self.addConstraint(horizontalConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}

