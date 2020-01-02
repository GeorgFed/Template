//
//  ExampleVC+UI.swift
//  Template
//
//  Created by Georg on 31.12.2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

// UI settings extension
extension ExampleVC {
    
    func setupUI() {
        view.backgroundColor = style.backgroundColor
        
        style.apply(textStyle: .title, to: welcomTitle)
        style.apply(textStyle: .subtitle, to: welcomSubtitle)
        style.apply(textStyle: .body, to: nameTF)
        style.apply(to: proceedButton)
        
        if let navigationBar = navigationController?.navigationBar {
            style.apply(to: navigationBar)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return style.preferredStatusBarStyle
    }
    
}

