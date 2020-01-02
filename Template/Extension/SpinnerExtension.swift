//
//  SpinnerExt.swift
//  tableView Test for iPresent
//
//  Created by Georg on 04/08/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

/// # LOADING SPINNET EXTENSION
/// Usage:
/// Create and show spinner:
/// let vSpinner = showSpinner(onView: self.view, red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
/// Hide spinner:
/// self.removeSpinner(vSpinner: vSpinner)

// TODO: - Swift5 Update
extension UIViewController {
    
    // Show spinner of color
    func showSpinner(onView : UIView, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        UIApplication.shared.beginIgnoringInteractionEvents()
        return spinnerView
    }
    
    // Remove specific spinner
    func removeSpinner(vSpinner: UIView!) {
        UIApplication.shared.endIgnoringInteractionEvents()
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
        }
    }
}
