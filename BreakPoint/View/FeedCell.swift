//
//  FeedCell.swift
//  BreakPoint
//
//  Created by juger rash on 15.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //Outlets -:
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var messageContentLbl: UILabel!
    
    //Functions -:
    func configureCell(profileImage: UIImage , email : String , messageContent : String) {
        self.userProfileImage.image = profileImage
        self.userEmailLbl.text = email
        self.messageContentLbl.text = messageContent
    }
}
