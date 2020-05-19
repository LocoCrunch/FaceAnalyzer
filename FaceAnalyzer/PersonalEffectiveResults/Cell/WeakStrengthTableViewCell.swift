//
//  WeakStrengthTableViewCell.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 5/19/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class WeakStrengthTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressView.layer.cornerRadius = 6.5
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 6.5
        progressView.subviews[1].clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
