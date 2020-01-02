//
//  ExampleVC.swift
//  Template
//
//  Created by Georg on 31.12.2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

class ExampleVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var welcomTitle: UILabel!
    @IBOutlet weak var welcomSubtitle: UILabel!
    @IBOutlet weak var greetings: UIImageView!
    
    @IBOutlet weak var proceedButton: CustomButton!
    @IBOutlet weak var nameTF: CustomTextField!
    
    var username: String?
    
    override func viewWillAppear(_ animated: Bool) {
        // Observe keyboard appearence to move up the view
        self.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Deactivate observer
        self.removeKeyboardObserver()
    }
    
    override func viewDidLoad() {
        // Hide keyboard on Tap function
        hideKeyboard()
        setupUI()
    }
    
    @IBAction func proceedPressed(_ sender: Any) {
        validateName()
    }
    func validateName() {
        // Name/Email/Password validation example
        guard let username = nameTF.text,
            username.isAlphabetic else {
                // See Alert extension for more alerts
                self.showOKAlert(title: "Error", message: "Please enter your name")
                return
        }
        self.username = username
        self.performSegue(withIdentifier: SegueIDs.exSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing data between controllers
        if segue.identifier == SegueIDs.exSegue {
            let DashboardTVC = segue.destination as! DashboardTVC
            DashboardTVC.username = self.username!
            
        }
    }
}
