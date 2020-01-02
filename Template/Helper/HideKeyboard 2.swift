//
//  tapToHideKeyboard.swift
//  iPresent prot. auth
//
//  Created by Georg on 02.09.2018.
//  Copyright © 2018 Georg. All rights reserved.
//

import UIKit

/// # HIDE KEYBOARD ON TAP
/// NOTE: Might cause problems with scroll views

extension UIViewController {
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
