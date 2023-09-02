//
//  KKCircularCountDownView.swift
//  KokteylUtils
//
//  Created by Taha Tosun on 2.12.2022.
//

import UIKit

public protocol KKCircularCountDownViewDelegate: AnyObject {
    func timeOver(countDownView: KKCircularCountDownView)
}

final public class KKCircularCountDownView: UIView {
    
    private lazy var countDownLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let backgroundLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let endPoint = CGFloat(3 * Double.pi / 2)
    private let startPoint = CGFloat(-Double.pi / 2)
    private weak var timer: Timer?
    
    @IBInspectable public var progressColor: UIColor = .white {
        didSet {
            updateLayers()
        }
    }
    
    @IBInspectable public var trackColor: UIColor = .white.withAlphaComponent(0.5) {
        didSet {
            updateLayers()
        }
    }
    
    @IBInspectable public var textColor: UIColor = .black {
        didSet {
            countDownLabel.textColor = textColor
        }
    }
    
    @IBInspectable public var barWidth: CGFloat = 5.0 {
        didSet {
            updateLayers()
        }
    }
    
    public var font: UIFont = .systemFont(ofSize: 18, weight: .bold) {
        didSet {
            countDownLabel.font = font
        }
    }
    
    @IBInspectable public var duration: Int = 0 {
        didSet {
            self.updateLabel(remainingTime: duration)
        }
    }
    
    @IBInspectable public var countDownLabelSuffix: String = ""
    weak var delegate: KKCircularCountDownViewDelegate?
    
    //MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        updateLayers()
        countDownLabel.font = font
        countDownLabel.textColor = textColor
        countDownLabel.textAlignment = .center
        countDownLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(countDownLabel)
        countDownLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        countDownLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    //MARK: - Private
    private func updateLayers() {
        backgroundLayer.removeFromSuperlayer()
        progressLayer.removeFromSuperlayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0),
                                radius: frame.size.width / 2.0,
                                startAngle: startPoint,
                                endAngle: endPoint,
                                clockwise: true)
        
        backgroundLayer.path = path.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = barWidth
        backgroundLayer.strokeColor = trackColor.cgColor
        self.layer.addSublayer(backgroundLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = barWidth
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.strokeEnd = 0
        self.layer.addSublayer(progressLayer)
    }
    
    private func updateLabel(remainingTime: Int) {
        self.countDownLabel.text = "\(remainingTime)" + countDownLabelSuffix
    }
    
    //MARK: - Public
    public func start() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1.0
        animation.duration = CFTimeInterval(self.duration)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnimation")
        
        timer?.invalidate()
        var remainingTime = duration
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            self.updateLabel(remainingTime: remainingTime)
            remainingTime -= 1
            
            if remainingTime < 0 {
                timer.invalidate()
                self.delegate?.timeOver(countDownView: self)
            }
        }
        timer?.fire()
    }
}
