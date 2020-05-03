//
//  ZodiakModel.swift
//  FaceAnalyzer
//
//  Created by VIKTORIA BURNOS on 3/22/20.
//  Copyright © 2020 VB. All rights reserved.
//

import RealmSwift

class ZodiakModel: Object {
    
    @objc dynamic var zodiakName = ""
    @objc dynamic var date = ""
    @objc dynamic var image = ""
    
    override class func primaryKey() -> String? {
        return "zodiakName"
    }
    
    static func zodiak(for date: Date) -> ZodiakModel {
        let calendar = Calendar.current
        let d = calendar.component(.day, from: date)
        let m = calendar.component(.month, from: date)

        switch (d,m) {
        case (21...31,1),(1...19,2):
            return ZodiakModel.aquarius()
        case (20...29,2),(1...20,3):
            return ZodiakModel.pisces()
        case (21...31,3),(1...20,4):
            return ZodiakModel.aries()
        case (21...30,4),(1...21,5):
            return ZodiakModel.taurus()
        case (22...31,5),(1...21,6):
            return ZodiakModel.gemini()
        case (22...30,6),(1...22,7):
            return ZodiakModel.cancer()
        case (23...31,7),(1...22,8):
            return ZodiakModel.leo()
        case (23...31,8),(1...23,9):
            return ZodiakModel.virgo()
        case (24...30,9),(1...23,10):
            return ZodiakModel.libra()
        case (24...31,10),(1...22,11):
            return ZodiakModel.scorpio()
        case (23...30,11),(1...21,12):
            return ZodiakModel.sagittarius()
        default:
            return ZodiakModel.capricorn()
        }
    }
    
    static func aries() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Aries"
        zodiak.date = "03/21 - 04/19"
        zodiak.image = "Aries"
        return zodiak
    }
    
    static func taurus() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Taurus"
        zodiak.date = "04/20 - 05/20"
        zodiak.image = "Taurus"
        return zodiak
    }
    
    static func gemini() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Gemini"
        zodiak.date = "05/20 - 06/20"
        zodiak.image = "Gemini"
        return zodiak
    }
    
    static func cancer() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Cancer"
        zodiak.date = "06/21 - 07/22"
        zodiak.image = "Cancer"
        return zodiak
    }
    
    static func leo() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Leo"
        zodiak.date = "08/22 - 07/23"
        zodiak.image = "Leo"
        return zodiak
    }
    
    static func virgo() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Virgo"
        zodiak.date = "08/23 - 09/22"
        zodiak.image = "Virgo"
        return zodiak
    }
    
    static func libra() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Libra"
        zodiak.date = "09/23 - 10/22"
        zodiak.image = "Libra"
        return zodiak
    }
    
    static func scorpio() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Scorpio"
        zodiak.date = "10/23 - 11/21"
        zodiak.image = "Scorpio"
        return zodiak
    }
    
    static func sagittarius() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Sagittarius"
        zodiak.date = "11/22 - 12/21"
        zodiak.image = "Sagittarius"
        return zodiak
    }
    
    static func capricorn() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Capricorn"
        zodiak.date = "12/22 - 01/19"
        zodiak.image = "Capricorn"
        return zodiak
    }
    
    static func aquarius() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Aquarius"
        zodiak.date = "01/20 - 02/18"
        zodiak.image = "Aquarius"
        return zodiak
    }
    
    static func pisces() -> ZodiakModel {
        let zodiak = ZodiakModel()
        zodiak.zodiakName = "Pisces"
        zodiak.date = "02/19 - 03/20"
        zodiak.image = "Pisces"
        return zodiak
    }

}





    

