//
//  GradientExtension.swift
//  tableView Test for iPresent
//
//  Created by Georg on 22/07/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

/// # VIEW APPEARENCE CUSTOMIZATION
extension UIView {
    
    // MARK: - View gradient
    func applyGradient(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomRight) {
        let gradient = CAGradientLayer(frame: self.bounds, colors: colors, startPoint: startPoint, endPoint: endPoint)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}

extension CAGradientLayer {
    
    // Convenience startPoint and endPoint enumeration
    enum Point {
        case topRight, topLeft
        case bottomRight, bottomLeft
        case custion(point: CGPoint)
        
        var point: CGPoint {
            switch self {
            case .topRight: return CGPoint(x: 1, y: 0)
            case .topLeft: return CGPoint(x: 0, y: 0)
            case .bottomRight: return CGPoint(x: 1, y: 1)
            case .bottomLeft: return CGPoint(x: 0, y: 1)
            case .custion(let point): return point
            }
        }
    }
    
    // CAGradientLayer convenience initialization
    convenience init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.init()
        self.frame = frame
        self.colors = colors.map { $0.cgColor }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: Point, endPoint: Point) {
        self.init(frame: frame, colors: colors, startPoint: startPoint.point, endPoint: endPoint.point)
    }
    
    // GradientImage for Navigation Bar
    func createGradientImage() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UINavigationBar {
    // MARK: - Gradient Navigation bar
    func setGradientBackground(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomRight) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
