//
//  DashboardTVC+UI.swift
//  Template
//
//  Created by Georg on 02.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import Foundation

extension DashboardTVC {
    func setupUI() {
        tableView.isScrollEnabled = false
        style.apply(textStyle: .title, to: titleLabel)
        if username != nil {
            titleLabel.text = "Hello, \(username!)"
        }
    }
}
