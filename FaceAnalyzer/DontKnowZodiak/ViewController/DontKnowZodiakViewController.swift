//
//  DontKnowZodiakViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 4/26/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class DontKnowZodiakViewController: UIViewController {
    
    @IBOutlet weak var backgroundDontKnowZodiakImage: UIImageView!
    @IBOutlet weak var zodiakDontKnowImageView: UIImageView!
    @IBOutlet weak var zodiakDontKnowLabel: UILabel!
    @IBOutlet weak var continueDontKnowButton: UIButton!
    @IBOutlet weak var dateZodiakPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - Configure

extension DontKnowZodiakViewController {
    
    func configure() {
        hideNavigationBar()
        configurePickerAppearance()
        configureButtonAppearance()
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configurePickerAppearance() {
        let color = UIColor.white
        dateZodiakPicker.setValue(color, forKey: "textColor")
        dateZodiakPicker.setValue(false, forKey: "highlightsToday")
    }
    
    func configureButtonAppearance() {
        continueDontKnowButton.setTitleColor(.white, for: .normal)
        continueDontKnowButton.backgroundColor = UIColor(red: 243 / 255, green: 129 / 255, blue: 11 / 255, alpha: 1)
        continueDontKnowButton.layer.cornerRadius = 27
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = continueDontKnowButton.bounds
        continueDontKnowButton.layer.insertSublayer(gradientLayer, at: 0)
        let backgroundColor = UIColor(red: 243 / 255, green: 129 / 255, blue: 11 / 255, alpha: 1)
        let bottomGradientColor = UIColor(red: 231 / 255, green: 181 / 255, blue: 46 / 255, alpha: 1)
        gradientLayer.colors = [backgroundColor.cgColor, bottomGradientColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = 27
    }
}

// MARK: -
// MARK: - Action

extension DontKnowZodiakViewController {
    
    @IBAction func continueDontKnowButtonAction(_ sender: Any) {
        let subscriptionVC = UIStoryboard(name: "Subscription", bundle: nil).instantiateInitialViewController() as! SubscriptionViewController
        navigationController?.pushViewController(subscriptionVC, animated: true)
    }
}
