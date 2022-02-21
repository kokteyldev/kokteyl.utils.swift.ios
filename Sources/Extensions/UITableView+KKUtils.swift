//
//  UITableView+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

public extension UITableView {
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    func footerLoadingView(_ size: CGSize?) -> UIView {
        let footerSize = (size != nil) ? size : CGSize(width: frame.size.width, height: 100)
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: footerSize!.width, height: footerSize!.height))
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = footerView.center
        footerView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        return footerView
    }
}
