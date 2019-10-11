//
//  User.swift
//  UserListApp
//
//  Created by User on 16/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
class Users: Codable{
    var users : [User]
    
    init(users : [User]){
        self.users = users
    }
}

class User : Codable {
    var name : String
    var fullName: String
    var email : String
    var mobNumber : Int
    
    init(name : String , fullName:String, email: String, mobNumber: Int) {
        self.name = name
        self.fullName = fullName
        self.email = email
        self.mobNumber = mobNumber
    }
    
    var namefirstLetter : String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
