//
//  Presenter.swift
//  UserListApp
//
//  Created by User on 16/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation

protocol Presenter {
    func initUL()
}

class UserPresenter : Presenter {
    var model :  Model
    var view :  View
    
    init(view : View, model : Model){
        self.view = view
        self.model = model
    }
    
    func initUL() {
        let  listOfUsers = model.getUserData()
        let listOfFirstLetters = model.getFirstLetters()
        let sections = model.getSectionOfUser()
        view.addUserDetails(listOfUser: listOfUsers)
        view.getListOfFirstLetter(firstLetters: listOfFirstLetters)
        view.getSectionOfUsers(sections: sections)
    }
}
