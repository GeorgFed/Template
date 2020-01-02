//
//  Style.swift
//  Template
//
//  Created by Georg on 28.12.2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

/// # APP APPEARENCE CUSTOMIZATION
/// This class ensures UI-design consistancy
/// Update myApp and myAppAttributes properties in order to change the default settings
/// -----------------------------------------------------------------------------
/// You can also apply custom changes with static functions, although it is not suggested: consistant typography
/// and color schemes provide better user experience

class Style {
    
    // MARK: - Text styles
    enum TextStyle {
        case navigationBar
        case title
        case subtitle
        case body
        case button
    }

    // MARK: - Text properties
    struct TextAttributes {
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?

        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }

    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
}

extension Style {
    
    // MARK: - Custom UI
    static func apply(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil, to label: UILabel) {
        let attributes = Style.TextAttributes(font: font, color: color)
        label.font = attributes.font
        label.textColor = attributes.color
        label.backgroundColor = attributes.backgroundColor
    }
    
    static func apply(font: UIFont, color: UIColor, backgroundColor: UIColor, to button: UIButton) {
        let attributes = Style.TextAttributes(font: font, color: color, backgroundColor: backgroundColor)
        button.setTitleColor(attributes.color, for: .normal)
        button.titleLabel?.font = attributes.font
        button.backgroundColor = attributes.backgroundColor
    }
    
    // MARK: - Default app style
    static var myApp: Style {
        return Style(
            backgroundColor: .white,
            preferredStatusBarStyle: .default,
            attributesForStyle: { $0.myAppAttributes }
        )
    }
    
    // MARK: - Apply style to elements
    func apply(textStyle: TextStyle, to textField: UITextField) {
        let attributes = attributesForStyle(textStyle)
        textField.font = attributes.font
        textField.textColor = attributes.color
        textField.backgroundColor = attributes.backgroundColor
    }
    
    func apply(textStyle: TextStyle, to label: UILabel) {
        let attributes = attributesForStyle(textStyle)
        label.font = attributes.font
        label.textColor = attributes.color
        label.backgroundColor = attributes.backgroundColor
    }

    func apply(textStyle: TextStyle = .button, to button: UIButton) {
        let attributes = attributesForStyle(textStyle)
        button.setTitleColor(attributes.color, for: .normal)
        button.titleLabel?.font = attributes.font
        button.backgroundColor = attributes.backgroundColor
    }

    func apply(textStyle: TextStyle = .navigationBar, to navigationBar: UINavigationBar) {
        let attributes = attributesForStyle(textStyle)
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: attributes.font,
            NSAttributedString.Key.foregroundColor: attributes.color
        ]

        if let color = attributes.backgroundColor {
            navigationBar.barTintColor = color
        }

        navigationBar.tintColor = attributes.color
        navigationBar.barStyle = preferredStatusBarStyle == .default ? .default : .black
    }
}

private extension Style.TextStyle {
    
    // MARK: - Default app text styles
    var myAppAttributes: Style.TextAttributes {
        switch self {
        case .navigationBar:
            return Style.TextAttributes(font: .title, color: .secondary, backgroundColor: .white)
        case .title:
            return Style.TextAttributes(font: .title, color: .primary)
        case .subtitle:
            return Style.TextAttributes(font: .subtitle, color: .secondary)
        case .body:
            return Style.TextAttributes(font: .body, color: .black, backgroundColor: .white)
        case .button:
            return Style.TextAttributes(font: .body, color: .white, backgroundColor: .primary)
        }
    }
}
