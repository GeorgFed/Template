//
//  UIViewControllerExtension.swift
//  Template
//
//  Created by Georg on 02.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import UIKit


extension UIViewController {
    
    // This method will observe connection status. See usage in DashboardTVC
    func reachability(restored: Selector, reachable: @escaping (_ status: Bool) -> ()) {
        NotificationCenter.default.addObserver(self, selector: restored, name: Notification.Name(Connection.cellular.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: restored, name: Notification.Name(Connection.wifi.rawValue), object: nil)
        reachable(Reachability.isConnectedToNetwork())
    }
    
    func addKeyboardObserver() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardNotifications(notification:)),
                                                   name: UIResponder.keyboardWillChangeFrameNotification,
                                                   object: nil)
        }

    func removeKeyboardObserver(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    // This method will notify when keyboard appears/ dissapears
    @objc func keyboardNotifications(notification: NSNotification) {

        var accurateY = 0.0  //Using this we will calculate the selected textFields Y Position

        if let activeTextField = UIResponder.currentFirst() as? UITextField {
            // Here we will get accurate frame of which textField is selected if there are multiple textfields
            let frame = self.view.convert(activeTextField.frame, from:activeTextField.superview)
            accurateY = Double(frame.origin.y) + Double(frame.size.height) + 64
        }

        if let userInfo = notification.userInfo {
            // here we will get frame of keyBoard (i.e. x, y, width, height)

            let keyBoardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let keyBoardFrameY = keyBoardFrame!.origin.y

            var newHeight: CGFloat = 0.0
            //Check keyboards Y position and according to that move view up and down
            if keyBoardFrameY >= UIScreen.main.bounds.size.height {
                newHeight = 0.0
            } else {
                if accurateY >= Double(keyBoardFrameY) { // if textfields y is greater than keyboards y then only move View to up
                    if #available(iOS 11.0, *) {
                        newHeight = -CGFloat(accurateY - Double(keyBoardFrameY)) - self.view.safeAreaInsets.bottom
                    } else {
                        newHeight = -CGFloat(accurateY - Double(keyBoardFrameY)) - 5
                    }
                }
            }
            //set the Y position of view
            self.view.frame.origin.y = newHeight
        }
    }
}

public extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
