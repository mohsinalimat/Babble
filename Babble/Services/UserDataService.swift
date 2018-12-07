//
//  UserDataService.swift
//  Babble
//
//  Created by Pavan Kumar N on 21/11/2018.
//  Copyright © 2018 Pavan Kumar N. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    
    func setUserData(id: String, name: String, email: String, avatarName:String, color: String){
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.id = id
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }

    func getUserAvatorColorFromString(components : String)->UIColor{
        //"[0.5,0.5,0.5,1]"
        let scanner = Scanner(string: components)
        let skipper = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipper
        
        var r,g,b,a : NSString?
        
        scanner.scanCharacters(from: comma, into: &r)
        scanner.scanCharacters(from: comma, into: &g)
        scanner.scanCharacters(from: comma, into: &b)
        scanner.scanCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(displayP3Red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newUIColor
    }
    
}