//
//  UITableViewExt.swift
//  tableView Test for iPresent
//
//  Created by Georg on 21/03/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

/// # IMAGE NAMES FOR TABLE VIEW CONDITIONS
enum ConditionImages: String {
    case noEvents = "noEvents"
    case noPresents = "noPresents"
    case noFriends = "noFriends"
    case noInternet = "noInternet"
    case noResults = "noSearchResults"
    case unknown = "unknownError"
}

/// # TABLE VIEW AND COLLECTION VIEW EMPTY STATES. REQUIRES STATE IMAGES.
/// To use this extension, add images for table view states to assets folder.
/// Attribute names from ConditionImages enumeration to the aforementioned images.

// MARK: - Table View State
extension UITableView {
    
    // MARK: - Set empty table view state
    func setEmptyView(title: String, message: String, alertImage: ConditionImages) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyView.backgroundColor = .white
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let imageName = alertImage.rawValue
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Title label appearence
        titleLabel.font = UIFont.title
        titleLabel.textColor = UIColor.label
        
        // Subtitle appearence
        messageLabel.font = UIFont.body
        messageLabel.textColor = UIColor.secondaryLabel
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(imageView)
        
        // Image position
        imageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -56).isActive = true
        imageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        // Title position
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        // Subtitle position
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 64).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -64).isActive = true
        
        // Text properties
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    // MARK: - Hide empty table view state
    func restore() {
        self.backgroundView = nil
    }
}

// MARK: - Collection View State
extension UICollectionView {
    
    // MARK: - Set empty collection view state
    func setEmptyView(title: String, message: String, alertImage: ConditionImages) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyView.backgroundColor = .white
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let imageName = alertImage.rawValue
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Title label appearence
        titleLabel.font = UIFont.title
        titleLabel.textColor = UIColor.label
        
        // Subtitle appearence
        messageLabel.font = UIFont.body
        messageLabel.textColor = UIColor.secondaryLabel
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(imageView)
        
        // Image position
        imageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -36).isActive = true
        imageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        // Title position
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.textAlignment = .center
        
        // Subtitle position
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 64).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -64).isActive = true
        messageLabel.textAlignment = .center
        
        // Text properties
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        self.backgroundView = emptyView
        self.bringSubviewToFront(emptyView)
    }
    
    // MARK: - Hide empty collection view state
    func restore() {
        self.backgroundView = nil
    }
}
