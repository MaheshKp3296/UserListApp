//
//  UserManager.swift
//  UserListApp
//
//  Created by User on 18/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
protocol  Model {
    func getUserData() -> [User]
    func getFirstLetters() -> [String]
    func getSectionOfUser() -> [[User]]
}

class UserManager : Model {
    private var userArray = [User]()
    private var sortedFirstLetters = [String]()
    private var sections = [[User]]()
    
    func getUserData() -> [User] {
        let file:String = "/Users/user/Documents/MKP/UserListApp/UserListApp/UserInfo.json"
        
        do{
            let json = try String(contentsOfFile: file)
            let data = json.data(using: String.Encoding.utf8)!
            let userDictionary  = try JSONDecoder().decode(Users.self, from: data)
            userArray = userDictionary.users
        }
        catch let err{
            print(err.localizedDescription)
        }
        return userArray
    }
    
    func getFirstLetters() -> [String]{
        let firstLetters = userArray.map { $0.namefirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        sortedFirstLetters = uniqueFirstLetters.sorted()
        return sortedFirstLetters
    }
    
    func getSectionOfUser() -> [[User]] {
        sections = sortedFirstLetters.map { firstLetter in
            return userArray
                .filter { $0.namefirstLetter == firstLetter } 
                .sorted { $0.name < $1.name}
        }
        return sections
    }
}
