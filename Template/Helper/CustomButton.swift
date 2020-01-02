//
//  CustomButton.swift
//  Template
//
//  Created by Georg on 01.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import UIKit

// TODO: - Add Shadow to Custom Button

@IBDesignable
class CustomButton: UIButton {
    let gradientLayer = CAGradientLayer()
    private var shadowLayer: CAShapeLayer!
    var cRadius: CGFloat?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    @IBInspectable override var cornerRadius: CGFloat {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.roundCorners(radius: cornerRadius)
            self.clipsToBounds = true
        }
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
    
    override var isHighlighted: Bool {
        didSet {
            let newOpacity : Float = isHighlighted ? 0.6 : 0.85
            let newRadius : CGFloat = isHighlighted ? 6.0 : 4.0
            
            let shadowOpacityAnimation = CABasicAnimation()
            shadowOpacityAnimation.keyPath = "shadowOpacity"
            shadowOpacityAnimation.fromValue = layer.shadowOpacity
            shadowOpacityAnimation.toValue = newOpacity
            shadowOpacityAnimation.duration = 0.1
            
            let shadowRadiusAnimation = CABasicAnimation()
            shadowRadiusAnimation.keyPath = "shadowRadius"
            shadowRadiusAnimation.fromValue = layer.shadowRadius
            shadowRadiusAnimation.toValue = newRadius
            shadowRadiusAnimation.duration = 0.1
            
            layer.add(shadowOpacityAnimation, forKey: "shadowOpacity")
            layer.add(shadowRadiusAnimation, forKey: "shadowRadius")
            
            layer.shadowOpacity = newOpacity
            layer.shadowRadius = newRadius
            
            let xScale : CGFloat = isHighlighted ? 1.025 : 1.0
            let yScale : CGFloat = isHighlighted ? 1.05 : 1.0
            UIView.animate(withDuration: 0.1) {
                let transformation = CGAffineTransform(scaleX: xScale, y: yScale)
                self.transform = transformation
            }
        }
    }
}

extension CALayer {
    private func addShadowWithRoundedCorners() {
        if let contents = self.contents {
            masksToBounds = false
            sublayers?.filter{ $0.frame.equalTo(self.bounds) }
                .forEach{ $0.roundCorners(radius: self.cornerRadius) }
            self.contents = nil
            if let sublayer = sublayers?.first {
                sublayer.removeFromSuperlayer()
            }
            let contentLayer = CALayer()
            contentLayer.contents = contents
            contentLayer.frame = bounds
            contentLayer.cornerRadius = cornerRadius
            contentLayer.masksToBounds = true
            insertSublayer(contentLayer, at: 0)
        }
    }
    
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 10
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
        if cornerRadius != 0 {
            addShadowWithRoundedCorners()
        }
    }
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
        if shadowOpacity != 0 {
            addShadowWithRoundedCorners()
        }
    }
}
