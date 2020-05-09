//
//  PersonalEffectiveViewController.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 5/2/20.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit
import PhotoSolution

class PersonalEffectiveViewController: UIViewController {
    
    let photoSolution = PhotoSolution()
    //var currentImages: [UIImage] = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -
// MARK: - Configure

private extension PersonalEffectiveViewController {
    
    func configure() {
        configurePhotoColution()
    }
    
    func configurePhotoColution() {
        photoSolution.delegate = self 
    }
    
    func takeAndPickPhotos() {
        self.present(photoSolution.getCamera(), animated: true, completion: nil)
        self.present(photoSolution.getPhotoPicker(maxPhotos: 1), animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: -

extension PersonalEffectiveViewController: PhotoSolutionDelegate {
    
    func returnImages(_ images: [UIImage]) {
//        for image in images {
//            if currentImages.count < maxPhotos{
//                currentImages.append(image)
//            }
//        }
    }
    
    func pickerCancel() {
//        print("Closed")
    }
}
