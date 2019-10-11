//
//  DetailViewController.swift
//  UserListApp
//
//  Created by User on 18/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgLabel: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var numberLbl: UILabel!
    
    var user : User?
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "Name: " + (user?.fullName)!
        emailLbl.text = "Email: " + (user?.email)!
        numberLbl.text = "Mob. No: " + String((user?.mobNumber)!)
        imgLabel.image = image
    }
    
}
