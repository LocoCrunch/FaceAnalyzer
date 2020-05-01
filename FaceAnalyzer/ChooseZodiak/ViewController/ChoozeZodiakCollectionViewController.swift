//
//  ChoozeZodiakCollectionViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/22/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class ChoozeZodiakCollectionViewController: UIViewController {
    
    // - UI
    @IBOutlet var chooseZodiakCollectionView: UICollectionView!
    @IBOutlet weak var backgroundChooseZodiakImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var footerButton: UIButton!
    
    // - Data
    private var zodiaks = [ZodiakModel]()
    
    // - Manager
    private let contentManager = ContentManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - CollectionViewDataSource

extension ChoozeZodiakCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zodiaks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseZodiak", for: indexPath) as! ChooseZodiakCollectionViewCell
        let zodiak = zodiaks[indexPath.row]
        cell.set(zodiak: zodiak)
        return cell
    }
    

}

// MARK: -
// MARK: - CollectionViewDelegate

extension ChoozeZodiakCollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let zodiak = zodiaks[indexPath.row]
        let subscriptionViewController = UIStoryboard(name: "Subscription" , bundle: nil).instantiateInitialViewController() as! SubscriptionViewController
        present(subscriptionViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 20) / 3 - 0.1
        let height = width
        let size = CGSize(width: width, height: height)
        return size
    }
}

// MARK: -
// MARK: - Action

extension ChoozeZodiakCollectionViewController {
    
    @IBAction func footerButtonAction(_ sender: Any) {
        let dontKnowZodiakVC = UIStoryboard(name: "DontKnowZodiak", bundle: nil).instantiateInitialViewController() as! DontKnowZodiakViewController
        self.navigationController?.pushViewController(dontKnowZodiakVC, animated: true)
        //zodiakVC.modalPresentationStyle = .fullScreen
        //present(zodiakVC, animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Configure

extension ChoozeZodiakCollectionViewController {
    
    func configure() {
        configureZodiaks()
        configureCollectionView()
        hideNavigationBar()
        configureFooterButton()
        updateView()
    }
    
    func configureZodiaks() {
        zodiaks = contentManager.zodiaks
    }
    
    
    func configureCollectionView() {
        chooseZodiakCollectionView.dataSource = self
        chooseZodiakCollectionView.delegate = self
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureFooterButton() {
        footerButton.layer.cornerRadius = 20
        footerButton.layer.borderWidth = 1.8
        footerButton.layer.borderColor = UIColor(red: 243 / 255, green: 201 / 255, blue: 91 / 255, alpha: 1).cgColor
    }
    
    func updateView() {
        chooseZodiakCollectionView.reloadData()
    }
    
}
