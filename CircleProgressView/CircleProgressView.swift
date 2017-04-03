//
//  CircleProgressView.swift
//  CircleProgressView
//
//  Created by BearLin on 2017/4/4.
//  Copyright © 2017年 BearLin. All rights reserved.
//

import UIKit

@IBDesignable
class CircleProgressView: UIView {

    // MARK: - Default constants
    
    static let DefaultProgressWidth: CGFloat = 20
    static let DefaultTrackColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
    static let DefaultProgressColor = UIColor(withHexString: "FA8803")

    // MARK: - Property
    // 进度槽
    private let trackLayer = CAShapeLayer()
    // 进度条
    private let progressLayer = CAShapeLayer()
    private let path = UIBezierPath()
    
    @IBInspectable
    var progress: Int = 0 {
        didSet {
            progress = progress > 100 ? 100 : progress
            progress = progress < 0 ? 0 : progress
        }
    }
    
    @IBInspectable
    var progressWidth: CGFloat = DefaultProgressWidth
    
    @IBInspectable
    var trackColor: UIColor = DefaultTrackColor
    
    @IBInspectable
    var progressColor: UIColor = DefaultProgressColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        // 绘制圆
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.width / 2 - progressWidth,
                    startAngle: -0.5 * CGFloat.pi,
                    endAngle: CGFloat.pi * 1.5,
                    clockwise: true)
        // 绘制进度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = progressWidth
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.path = path.cgPath
        layer.addSublayer(trackLayer)
        
        // 绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = progressWidth
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.path = path.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress) / 100.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(_ progress: Int, animated animate: Bool, withDuration duration: TimeInterval) {
        self.progress = progress
        
        CATransaction.begin()
        CATransaction.setDisableActions(!animate)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(duration)
        progressLayer.strokeEnd = CGFloat(progress) / 100.0
        CATransaction.commit()
    }
    
}
