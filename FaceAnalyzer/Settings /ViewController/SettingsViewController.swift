//
//  SettingsViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/29/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var bacgroundSettingsImageView: UIImageView!
    @IBOutlet weak var iconPremiumImageView: UIImageView!
    @IBOutlet weak var upgrade1Label: UILabel!
    @IBOutlet weak var upgrade2Label: UILabel!
    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var buttonsTableView: UITableView!
    
    // - Data
    private var name = ["Terms of service","Privacy policy","Version","Notifications"]
    private var smallIconName = ["termsofservice","Privacypolicy","Version","Notifications"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showTabBar()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
  
}

// MARK: -
// MARK: - Action

extension SettingsViewController {
    
    @IBAction func upgradeButtonAction(_ sender: Any) {
        let subVC = UIStoryboard(name: "Subscription", bundle: nil).instantiateInitialViewController() as! SubscriptionViewController
        navigationController?.pushViewController(subVC, animated: true)
    }
}

// MARK: -
// MARK: - DataSource

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        cell.nameSettingsLabel?.text = self.name[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.smallIconImageView.image = UIImage(named: self.smallIconName[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       buttonsTableView.deselectRow(at: indexPath, animated: true)
       if indexPath.row == 0 {
       let termsVC = UIStoryboard(name: "TermsOfService", bundle: nil).instantiateInitialViewController() as! TermsOfServiceViewController
        navigationController?.pushViewController(termsVC, animated: true)
       }
    }
}

// MARK: -
// MARK: - Delegate

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

// MARK: -
// MARK: - Configure

private extension SettingsViewController {
    
    func configure() {
        configureUpgradeButton()
        showTabBar()
        configureTableView()
        configureTableViewAppearance()
    }
    
    func configureUpgradeButton() {
        upgradeButton.layer.cornerRadius = 22
        upgradeButton.setTitleColor(.white, for: .normal)

        let gradientLayer = CAGradientLayer()
        
        let backgroundColor = UIColor(red: 243 / 255, green: 129 / 255, blue: 11 / 255, alpha: 1)
        let bottomGradientColor = UIColor(red: 231 / 255, green: 181 / 255, blue: 46 / 255, alpha: 1)
        
        gradientLayer.colors = [backgroundColor.cgColor, bottomGradientColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = 22
        
        gradientLayer.frame = upgradeButton.bounds
        upgradeButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func showTabBar() {
        tabBarController?.tabBar.isHidden = false
    }
    
    func configureTableView() {
        buttonsTableView.dataSource = self
        buttonsTableView.delegate = self
    }
    
    func configureTableViewAppearance() {
        buttonsTableView.layer.cornerRadius = 10
    }

}
