//
//  MainMenuViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/29/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var rotateImageView: UIImageView!
    @IBOutlet weak var rotateLabel: UILabel!
    @IBOutlet weak var aimImageView: UIImageView!
    @IBOutlet weak var description1Label: UILabel!
    @IBOutlet weak var description2Label: UILabel!
    @IBOutlet weak var mainMenuCollectionView: UICollectionView!
    
    // - Data
    private var iconImageName = ["BEAUTY_COMPETITION","COMPATIBILITY","FUTURE_CHILD","HOROSCOPE", "PERSONAL_EFFECTIVE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - DataSource

extension MainMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconImageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuCollectionViewCell", for: indexPath) as! MainMenuCollectionViewCell
        cell.mainMenuButtonImage.image = UIImage(named: self.iconImageName[indexPath.row])
        
        if iconImageName == ["BEAUTY_COMPETITION"] {
            description1Label.text = "BEAUTY COMPETITION"
        } else if iconImageName == ["COMPATIBILITY"] {
            description1Label.text = "COMPATIBILITY"
        } else if iconImageName == ["FUTURE_CHILD"] {
            description1Label.text = "FUTURE CHILD"
        } else if iconImageName == ["HOROSCOPE"] {
            description1Label.text = "HOROSCOPE"
        } else if iconImageName == ["PERSONAL_EFFECTIVE"] {
            description1Label.text = "PERSONAL EFFECTIVE"
        }
        
        return cell
    }
}

// MARK: -
// MARK: - DelegateFlowLayout

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}

// MARK: -
// MARK: - Configure

extension MainMenuViewController {
    
    func configure() {
        iconsPosition()
        hideNavigationItems()
        //showTabBarViewController()
        configureCollectionView()
    }
    
    func iconsPosition() {
        mainMenuCollectionView.contentInset = UIEdgeInsets(top: 0, left: -1.0, bottom: 0, right: 1.0)
    }
    
    func hideNavigationItems() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    func showTabBarViewController() {
//        let tabBarVC = TabBarViewController()
//        present(tabBarVC, animated: true, completion: nil)
//        tabBarVC.modalPresentationStyle = .overFullScreen
//    }
    
    func configureCollectionView() {
        mainMenuCollectionView.dataSource = self
        mainMenuCollectionView.delegate = self
    }
}
