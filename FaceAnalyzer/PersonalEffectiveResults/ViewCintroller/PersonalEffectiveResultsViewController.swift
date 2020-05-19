//
//  PersonalEffectiveResultsViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 5/9/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit
import ReadMoreTextView

class PersonalEffectiveResultsViewController: UIViewController {
    
    @IBOutlet weak var personalEffectiveCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - DataSource

extension PersonalEffectiveResultsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            headerCell.aimImageView.image = UIImage(named: "aim_analyzer")
            headerCell.backgroundImageView.image = UIImage(named: "backgroundPersonalEffective")
            headerCell.nameLabel.text = "KARA"
            return headerCell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as! GeneralCollectionViewCell
            cell.generalLabel?.text = "GENERAL"
            cell.generalTextView.text = "Last update: January 28, 2020\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut tincidunt turpis. Nunc efficitur massa ante, quis euismod purus mattis eu. Proin efficitur elit erat. Quisque hendrerit tempor turpis, sit amet rhoncus orci mollis sed. Nam faucibus scelerisque risus a cursus.\n Fusce rutrum interdum erat, non iaculis velit fringilla at. Phasellus sed velit mattis, varius arcu mattis, rutrum libero. Nunc semper libero turpis, sed placerat tortor blandit dignissim.Integer augue urna, faucibus id congue ut, viverra eget leo. In vitae placerat tellus.\n Curabitur gravida ultricies nunc eu sodales. Proin vitae dui non risus convallis rhoncus. Sed finibus augue sit amet metus interdum dignissim."
            cell.generalTextView.shouldTrim = true
            cell.generalTextView.maximumNumberOfLines = 3
            
            
            let readMoreTextAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor : UIColor.orange,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            let readLessTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.orange,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
            ]
            cell.generalTextView.attributedReadMoreText = NSAttributedString(string: "MORE", attributes: readMoreTextAttributes)
            cell.generalTextView.attributedReadLessText = NSAttributedString(string: "HIDE", attributes: readLessTextAttributes)
            return cell
        } else {
            let weakStrengthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeakStrengthCollectionViewCell", for: indexPath) as! WeakStrengthCollectionViewCell
            return weakStrengthCell
        }
    }
}

// MARK: -
// MARK: - Delegate

extension PersonalEffectiveResultsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let heightInt: Int = 140
        let height = CGFloat(heightInt)
        let size = CGSize(width: width, height: height)
        return size
    }
}

// MARK: -
// MARK: - Configure

private extension PersonalEffectiveResultsViewController {
    
    func configure() {
        hideNavigationBar()
//        configurePersonalityButton()
//        configureFutureButton()
            //configureTableViewAppearance()
        configureTableView()
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    func configurePersonalityButton() {
//        personalityButton.layer.cornerRadius = 15
//        personalityButton.setTitleColor(.white, for: .normal)
//
//        let gradientLayer = CAGradientLayer()
//
//        let backgroundColor = UIColor(red: 243 / 255, green: 129 / 255, blue: 11 / 255, alpha: 1)
//        let bottomGradientColor = UIColor(red: 231 / 255, green: 181 / 255, blue: 46 / 255, alpha: 1)
//
//        gradientLayer.colors = [backgroundColor.cgColor, bottomGradientColor.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.cornerRadius = 15
//
//        gradientLayer.frame = personalityButton.bounds
//        personalityButton.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func configureFutureButton() {
//        futureButton.layer.cornerRadius = 15
//        futureButton.setTitleColor(.white, for: .normal)
//
//        let gradientLayer = CAGradientLayer()
//
//        let backgroundColor = UIColor(red: 243 / 255, green: 129 / 255, blue: 11 / 255, alpha: 1)
//        let bottomGradientColor = UIColor(red: 231 / 255, green: 181 / 255, blue: 46 / 255, alpha: 1)
//
//        gradientLayer.colors = [backgroundColor.cgColor, bottomGradientColor.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.cornerRadius = 15
//
//        gradientLayer.frame = futureButton.bounds
//        futureButton.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func configureTableViewAppearance() {
//        personalEffectiveCollectionView.layer.cornerRadius = 18
//    }
    
    func configureTableView() {
        personalEffectiveCollectionView.dataSource = self
        personalEffectiveCollectionView.delegate = self
    }
}
