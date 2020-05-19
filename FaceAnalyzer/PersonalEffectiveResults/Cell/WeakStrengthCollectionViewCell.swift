//
//  WeakStrengthCollectionViewCell.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 5/15/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class WeakStrengthCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var weakStrengthTableView: UITableView!
    
    // - Data
    private var name = ["Reaserved","Insensitive","Bossy","Agressive"]
    private var name2 = ["Hard-working","Diplomatic","Charming","Calm","Objective","Intelligent"]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
}

// MARK: -
// MARK: - Table View Data Source

extension WeakStrengthCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeakStrengthTableViewCell", for: indexPath) as! WeakStrengthTableViewCell
        cell.categoryNameLabel?.text = self.name[indexPath.row]
        cell.progressView.progress = 0.77
        let currentProgress = cell.progressView.progress
        cell.progressLabel?.text = "\(currentProgress * 100)%"
        return cell
    }
    
    
}

// MARK: -
// MARK: - Table View Delegate

extension WeakStrengthCollectionViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

// MARK: -
// MARK: - Configure

private extension WeakStrengthCollectionViewCell {
    func configure() {
        configureTableView()
    }
    
    func configureTableView() {
        weakStrengthTableView.delegate = self
        weakStrengthTableView.dataSource = self
    }
}
