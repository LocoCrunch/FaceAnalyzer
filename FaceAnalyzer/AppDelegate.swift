//
//  AppDelegate.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/21/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // - UI
    var window: UIWindow?
    
    // - Manager
    private let contentManager = ContentManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configure()
        return true
    }
    
}

// MARK: -
// MARK: - Configure

private extension AppDelegate {
    
    func configure() {
        configureContentManager()
        setupRootViewController()
    }
    
    func configureContentManager() {
        contentManager.configure()
    }
    
    func setupRootViewController() {
        let mainVC = UIStoryboard(storyboard: .personalEffective).instantiateInitialViewController() as! PersonalEffectiveResultsViewController
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            //window.rootViewController = TabBarViewController()
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
    }
    
}
