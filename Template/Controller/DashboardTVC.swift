//
//  DashboardTVC.swift
//  Template
//
//  Created by Georg on 02.01.2020.
//  Copyright © 2020 Georg. All rights reserved.
//

import UIKit

struct Card {
    var name: String
    var body: String
    var imageName: String
    
    init(name: String, body: String, imageName: String) {
        self.name = name
        self.body = body
        self.imageName = imageName
    }
}

class DashboardTVC: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var username: String?
    
    // Example Dataset
    fileprivate let cards = [Card(name: "Moscow", body: "Capital of Russia", imageName: "Moscow"),
                             Card(name: "Paris", body: "Capital of France", imageName: "Paris"),
                             Card(name: "London", body: "Capital of Great Britain", imageName: "London"),
                             Card(name: "Berlin", body: "Capital of Germany", imageName: "Berlin")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.reachability(restored: #selector(networkRestored)) { (reachable) in
            if !reachable {
                self.tableView.setEmptyView(title: "No internet connection".localized, message: "", alertImage: .noInternet)
            } else {
                self.tableView.restore()
            }
        }
        setupUI()
    }
    
    @objc func networkRestored() {
        tableView.restore()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 96
        default:
            return screenHeight - 96
        }
    }
}

extension DashboardTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.card, for: indexPath) as? DashboardCard {
            let name: String = cards[indexPath.row].name
            let imageName: String = cards[indexPath.row].imageName
            let body: String = cards[indexPath.row].body
            cell.configure(name: name, body: body, imageName: imageName)
            return cell
        }
        return DashboardCard()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // Collection view layout - 2 columns
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + flowLayout.minimumInteritemSpacing
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
        return CGSize(width: size, height: Int(Double(size) * 1.5))
    }
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
