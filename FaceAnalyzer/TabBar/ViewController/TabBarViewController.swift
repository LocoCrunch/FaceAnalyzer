//
//  TabBarViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/29/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

// MARK: -
// MARK: - Configure

private extension TabBarViewController {
    
    func configure() {
        configureControllers()
        tabBarAppearance()
        showMainScreen()
    }
    
    func tabBarAppearance() {
        tabBar.barTintColor = UIColor(red: 91 / 255, green: 34 / 255, blue: 98 / 255, alpha: 1)
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .white
    }
    
    func configureControllers() {
        let firstViewController = UIStoryboard(storyboard: .profile).instantiateInitialViewController() as! ProfileViewController
        let firstTabBarItem = UITabBarItem()
        firstTabBarItem.image = UIImage(named: "profile_icon")
        firstTabBarItem.selectedImage = UIImage(named: "icon_profile_active")
        firstViewController.tabBarItem = firstTabBarItem

        let secondViewController = UIStoryboard(storyboard: .mainMenu).instantiateInitialViewController() as! MainMenuViewController
        let secondTabBarItem = UITabBarItem()
        secondTabBarItem.image = UIImage(named: "analyzer")
        secondTabBarItem.selectedImage = UIImage(named: "analyzer")
        secondViewController.tabBarItem = secondTabBarItem

        let thirdViewController = UIStoryboard(storyboard: .settings).instantiateInitialViewController() as! SettingsViewController
        let thirdTabBarItem = UITabBarItem()
        thirdTabBarItem.image = UIImage(named: "settings")
        thirdTabBarItem.selectedImage = UIImage(named: "settings_active")
        thirdViewController.tabBarItem = thirdTabBarItem
        
        viewControllers = [firstViewController, secondViewController, thirdViewController].map {
            let navController = UINavigationController(rootViewController: $0)
            navController.navigationBar.isTranslucent = false
            navController.navigationBar.isHidden = true
            return navController
        }
        
    }
    
    func showMainScreen() {
        selectedIndex = 1
    }
    
}

