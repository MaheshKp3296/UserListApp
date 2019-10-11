//
//  View.swift
//  UserListApp
//
//  Created by User on 18/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
protocol View {
    func addUserDetails(listOfUser: [User])
    func getListOfFirstLetter(firstLetters: [String])
    func getSectionOfUsers(sections : [[User]])
}
