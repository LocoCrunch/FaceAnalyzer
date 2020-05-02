//
//  MainMenuViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/29/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit
import CollectionViewPagingLayout

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
    let layout = CollectionViewPagingLayout()
    private var didScrollCollectionViewToMiddle = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didScrollCollectionViewToMiddle {
            let layout = mainMenuCollectionView.collectionViewLayout as? CollectionViewPagingLayout
            layout?.setCurrentPage(0, animated: false)
            didScrollCollectionViewToMiddle = true
        }
        
        mainMenuCollectionView.collectionViewLayout.invalidateLayout()
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
        
        if indexPath.row == 0 {
            description1Label.text = "BEAUTY COMPETITION"
        } else if indexPath.row == 1 {
            description1Label.text = "COMPATIBILITY"
        } else if indexPath.row == 2 {
            description1Label.text = "FUTURE CHILD"
        } else if indexPath.row == 3 {
            description1Label.text = "HOROSCOPE"
        } else if indexPath.row == 4 {
            description1Label.text = "PERSONAL EFFECTIVE"
        }
        
        return cell
    }
}

// MARK: -
// MARK: - DelegateFlowLayout

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        let termsVC = UIStoryboard(name: "PersonalEffective", bundle: nil).instantiateInitialViewController() as! PersonalEffectiveViewController
         navigationController?.pushViewController(termsVC, animated: true)
        } else if indexPath.row == 1 {
        let termsVC = UIStoryboard(name: "Compatibility", bundle: nil).instantiateInitialViewController() as! CompatibilityViewController
         navigationController?.pushViewController(termsVC, animated: true)
        } else if indexPath.row == 2 {
        let termsVC = UIStoryboard(name: "FutureChild", bundle: nil).instantiateInitialViewController() as! FutureChildViewController
         navigationController?.pushViewController(termsVC, animated: true)
        } else if indexPath.row == 3 {
        let termsVC = UIStoryboard(name: "Horoscope", bundle: nil).instantiateInitialViewController() as! HoroscopeViewController
        navigationController?.pushViewController(termsVC, animated: true)
        } else {
        let termsVC = UIStoryboard(name: "BeautyCompetition", bundle: nil).instantiateInitialViewController() as! BeautyCompetitionViewController
         navigationController?.pushViewController(termsVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}

// MARK: -
// MARK: - Configure

extension MainMenuViewController {
    
    func configure() {
        hideNavigationItems()
        configureLayout()
        //showTabBarViewController()
        configureCollectionView()
    }
    
    func hideNavigationItems() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    func showTabBarViewController() {
//        let tabBarVC = TabBarViewController()
//        present(tabBarVC, animated: true, completion: nil)
//        tabBarVC.modalPresentationStyle = .overFullScreen
//    }
    
    func configureLayout() {
        mainMenuCollectionView.collectionViewLayout = layout
        mainMenuCollectionView.isPagingEnabled = true
    }
    
    func configureCollectionView() {
        mainMenuCollectionView.dataSource = self
        mainMenuCollectionView.delegate = self
        mainMenuCollectionView.reloadData()
    }
}
