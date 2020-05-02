//
//  MainMenuCollectionViewCell.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 4/30/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit
import CollectionViewPagingLayout

class MainMenuCollectionViewCell: UICollectionViewCell, ScaleTransformView {
    
    // - UI
    @IBOutlet weak var mainMenuButtonImage: UIImageView!
    
    var scaleOptions = ScaleTransformViewOptions(
        minScale: 0.7,
        scaleRatio: 0.6,
        translationRatio: CGPoint(x: 0.66, y: 0.2),
        minTranslationRatio: CGPoint(x: -1, y: 0),
        maxTranslationRatio: CGPoint(x: 1, y: 1),
        rotation3d: .init(angle: .pi / 15, minAngle: -.pi / 3, maxAngle: .pi / 3, x: 0, y: 0, z: 1, m34: -0.004),
        translation3d: .init(translateRatios: (200, UIScreen.main.bounds.width * 0.1, 0),
                             minTranslates: (-1_000, -UIScreen.main.bounds.width, -100),
                             maxTranslates: (1_000, UIScreen.main.bounds.width, -100))
    )
    
    
//    var scaleOptions = ScaleTransformViewOptions(
//        minScale: 0.6,
//        scaleRatio: 0.4,
//        translationRatio: CGPoint(x: 0.66, y: 0.2),
//        keepVerticalSpacingEqual: true,
//        keepHorizontalSpacingEqual: true,
//        scaleCurve: .easeIn,
//        translationCurve: .linear
//    )
    
    func configureImageShape() {
        mainMenuButtonImage.layer.cornerRadius = mainMenuButtonImage.frame.size.height / 2
    }
}
