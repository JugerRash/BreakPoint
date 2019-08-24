//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by juger rash on 22.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    //Outlets -:
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var emailLbl : UILabel!
    @IBOutlet weak var contentLbl : UILabel!
    
    //Functions -:
    func configureCell(image : UIImage , email : String , content : String) {
        self.profileImage.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
