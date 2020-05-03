//
//  SubscriptionViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/28/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var check1Image: UIImageView!
    @IBOutlet weak var check2Image: UIImageView!
    @IBOutlet weak var check3Image: UIImageView!
    @IBOutlet weak var check4Image: UIImageView!
    @IBOutlet weak var check5Image: UIImageView!
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var text3Label: UILabel!
    @IBOutlet weak var text4Label: UILabel!
    @IBOutlet weak var text5Label: UILabel!
    @IBOutlet weak var startSubscriptionButton: UIButton!
    @IBOutlet weak var info1Label: UILabel!
    @IBOutlet weak var info2Label: UILabel!
    @IBOutlet weak var restorePurchasesLabel: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    // - Manager
    private var iappManager: SubscriptionIAPManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - Action

extension SubscriptionViewController {
    
    @IBAction func startSubscriptionButtonAction(_ sender: Any) {}
    
    @IBAction func closeButtonAction(_ sender: Any) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
}
    
// MARK: -
// MARK: - Configure

extension SubscriptionViewController {
    
    func configure() {
        hideNavigationItems()
        editStartSubscriptionButton()
        editCloseButton()
    }
    
    func hideNavigationItems() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    func editStartSubscriptionButton() {
       startSubscriptionButton.titleLabel?.numberOfLines = 2
       startSubscriptionButton.setTitle("START SUBSCRIPTION", for: .normal)
    }
    
    func editCloseButton() {
        closeButton.layer.cornerRadius = 15
    }

}
