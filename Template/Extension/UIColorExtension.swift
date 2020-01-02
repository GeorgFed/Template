//
//  UIColorExtension.swift
//  Template
//
//  Created by Georg on 02.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import UIKit

extension UIColor {
    public static var random: UIColor {
        let max = CGFloat(UInt32.max)
        let red = CGFloat(arc4random()) / max
        let green = CGFloat(arc4random()) / max
        let blue = CGFloat(arc4random()) / max
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
