//
//  UITableViewExtension.swift
//  Template
//
//  Created by Georg on 28.12.2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

// NOTE: Messages should be added in Constants file
extension UIViewController {
    // Default one-button aler
    func showOKAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title.localized, message: message.localized, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        alertController.view.tintColor = .button
    }
    
    // default yes/no alert
    func showYesNoAlert(title: String, message: String, action: @escaping () -> ()) {
        let alert = UIAlertController(title: title.localized, message: message.localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes".localized, style: .destructive, handler: { (_) in action() }))
        alert.addAction(UIAlertAction(title: "No".localized, style: .cancel, handler: nil))
        alert.view.tintColor = .button
        self.present(alert, animated: true, completion: nil)
    }
    
    // Custom alert. Pass action as a Handler. 
    func showCustomAlert(title: String, message: String, actionOneTitle: String, actionTwoTitle: String, actionOne: @escaping () -> (), actionTwo: @escaping () -> ()) {
        let alert = UIAlertController(title: title.localized, message: message.localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionOneTitle.localized, style: .default, handler: { (_) in actionOne() }))
        alert.addAction(UIAlertAction(title: actionTwoTitle.localized, style: .default, handler: { (_) in actionTwo() }))
        alert.view.tintColor = .button
        self.present(alert, animated: true, completion: nil)
    }
}
