//
//  KKAnimatedImageView.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 21.02.2022.
//

import UIKit

final public class KKAnimatedImageView: UIImageView {
    public var imageName: String?
    public var frameCount: Int = 0
    public var duration: TimeInterval = 2
    public var imageTintColor: UIColor?

    // MARK: - View Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        self.contentMode = .scaleAspectFit
    }
    
    // MARK: - Animation
    
    public func startAnimation() {
        guard let imageName = imageName, frameCount != 0 else { return }
        
        var images: [UIImage] = []
        
        for i in 1...frameCount {
            let imageName = "\(imageName)-\(i)"
            if let image = UIImage(named: imageName) {
                if let imageTintColor, let tintedImage = image.imageWithColor(imageTintColor) {
                    images.append(tintedImage)
                } else {
                    images.append(image)
                }
            }
        }
        
        if images.count == 0 { return }
        
        self.animationRepeatCount = 0
        self.animationDuration = duration
        self.animationImages = images
        self.startAnimating()
    }
}
