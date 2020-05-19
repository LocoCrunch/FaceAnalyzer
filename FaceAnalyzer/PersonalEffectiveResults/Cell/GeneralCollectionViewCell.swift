//
//  GeneralCollectionViewCell.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 5/14/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit
import ReadMoreTextView

class GeneralCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var generalTextView: ReadMoreTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        generalTextView.onSizeChange = { _ in }
        generalTextView.shouldTrim = true
    }
}
