//
//  UserViewCell.swift
//  UserListApp
//
//  Created by User on 18/09/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {

    @IBOutlet weak private(set) var nameLabel: UILabel!
    @IBOutlet weak private(set) var imgLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindCell(user : User) {
        self.nameLabel.text = user.name
        self.imgLabel.image = UIImage(named: "ContactThumbnail")
    }

}
