//
//  Storyboard.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/29/20.
//  Copyright © 2020 VB. All rights reserved.
//

import Foundation

enum Storyboard: String {
    
    case nameEnter = "NameEnter"
    case chooseZodiak = "ChooseZodiak"
    case subscription = "Subscription"
    case mainMenu = "MainMenu"
    case profile = "Profile"
    case settings = "Settings"
    case dontKnowZodiak = "DontKnowZodiak"
    
    var filename: String {
        return rawValue
    }

}
