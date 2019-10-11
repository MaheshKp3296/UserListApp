//
//  ViewController.swift
//  UserListApp
//
//  Created by User on 16/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate, View {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var listOfUsers = [User]()
    var originalSectons = [[User]]()
    var sortedFirstLetters = [String]()
    var searchedSection = [[User]]()
    var searching = false {
        didSet {
            self.table.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var  presenter : Presenter?
        presenter = UserPresenter(view: self, model: UserManager())
        presenter?.initUL()
    }
    
    func addUserDetails(listOfUser: [User]) {
        self.listOfUsers = listOfUser
    }
    
    func getListOfFirstLetter(firstLetters: [String]) {
        self.sortedFirstLetters = firstLetters
    }
    
    func getSectionOfUsers(sections : [[User]]) {
        self.originalSectons = sections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searching == true{
            return nil
        }
        else {
            return sortedFirstLetters[section]
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching == true {
            return searchedSection.count
        }
        else{
            return originalSectons.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true {
            return searchedSection[section].count
        }
        else{
            return originalSectons[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "userCell") as! UserViewCell
        var userToDisplay : User!
        
        if searching == true {
            userToDisplay = searchedSection[indexPath.section][indexPath.row]
        }
        else {
            userToDisplay = originalSectons[indexPath.section][indexPath.row]
        }
        cell.bindCell(user: userToDisplay)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC : DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
        var user : User!
        if searching == true {
            user =   searchedSection[indexPath.section][indexPath.row]
            detailsVC.image = UIImage(named: "ContactThumbnail")
        }
        else {
            user = originalSectons[indexPath.section][indexPath.row]
            detailsVC.image = UIImage(named: "ContactThumbnail")
        }
        detailsVC.user = user
    }
}

extension ViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            searchedSection = originalSectons
            return
        }
        searchedSection = [listOfUsers.filter( { listOfUsers -> Bool in guard let text = searchBar.text else {return false }
            return listOfUsers.name.contains(text) } ) ]
        
        if searchedSection.count == 0 {
            searching = false
        }
        else {
            searching = true
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text =  ""
    }
    
}

