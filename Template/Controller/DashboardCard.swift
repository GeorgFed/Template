//
//  DashboardCard.swift
//  Template
//
//  Created by Georg on 02.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import UIKit

class DashboardCard: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var body: UILabel!
    var imageName: String!
    
    override func awakeFromNib() {
        setupUI()
    }
    
    func setupUI() {
        
        Style.apply(font: .subtitle, color: .white, to: name)
        Style.apply(font: .body, color: .white, to: body)

        // Cell appearence(with shadow)
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 0.0
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.masksToBounds = true;
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 2.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.15
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds,
                                             cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
    func addImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        imageView.image = UIImage(named: imageName)
        self.contentView.insertSubview(imageView, at: 0)
        let bottomColor = UIColor.random
        bottomColor.withAlphaComponent(0.8)
        let upperColor = UIColor.random
        upperColor.withAlphaComponent(0.2)
        // - ImageViewExtension
        imageView.applyGradientOverlayWithBlur(colors: [bottomColor, upperColor])
    }
    
    public func configure(name: String, body: String, imageName: String) {
        self.name.text = name
        self.body.text = body
        self.imageName = imageName
        addImage()
        setupUI()
    }
}
