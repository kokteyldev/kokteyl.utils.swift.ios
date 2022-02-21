//
//  KKAnimatedImageView.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 21.02.2022.
//

import UIKit

final public class KKAnimatedImageView: UIImageView {
    var imageName: String?
    var frameCount: Int = 0
    var duration: TimeInterval = 2
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        self.contentMode = .scaleAspectFit
    }
    
    // MARK: - Animation
    
    func startAnimation() {
        guard let imageName = imageName, frameCount != 0 else { return }
        
        var images: [UIImage] = []
        
        for i in 1...frameCount {
            let imageName = "\(imageName)-\(i)"
            if let image = UIImage(named: imageName) {
                images.append(image)
            }
        }
        
        if images.count == 0 { return }
        
        self.animationRepeatCount = 0
        self.animationDuration = duration
        self.animationImages = images
        self.startAnimating()
    }
}
