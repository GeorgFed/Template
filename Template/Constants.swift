//
//  Constants.swift
//  Template
//
//  Created by Georg on 28.12.2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

/// # APP CONSTANTS
/// Maintain your code clean by keeping all contants in this file
/// Use UIColor and UIFont extensions to declare your app's color scheme and typography
/// Use enumerations for Notifications and Alerts


// MARK: - Default app style declaration
let style = Style.myApp

// MARK: - Connection States
enum Connection: String {
    case wifi = "wifi"
    case cellular = "cellular"
    case unavailable = "unavailable"
    case none = "none"
}

// MARK: - App alerts
enum Alert: String {
    case unknown = "Error"
}

// MARK: - Constant Strings
struct Messages {
    static let unknown = "Unknown error. Try again later"
}

struct Cells {
    static let card = "DASHBOARD_CARD"
}

struct SegueIDs {
    static let exSegue = "ExSegue"
}
// MARK: - App color scheme
extension UIColor {
    static var primary: UIColor {
        return UIColor.label
    }
    static var secondary: UIColor {
        return UIColor.secondaryLabel
    }
    static var tertiary: UIColor {
        return UIColor.systemFill
    }
    static var button: UIColor {
        return .systemPink
    }
}

// MARK: - App typography
extension UIFont {
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
    }
    static var subtitle: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
    }
    static var body: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
}
