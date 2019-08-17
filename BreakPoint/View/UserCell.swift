//
//  UserCell.swift
//  BreakPoint
//
//  Created by juger rash on 17.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    //Outlets -:
    @IBOutlet weak var userProfileImage : UIImageView!
    @IBOutlet weak var userEmailLbl : UILabel!
    @IBOutlet weak var checkMarkImage : UIImageView!
  
    //Variables -:
    var showing = false

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
                checkMarkImage.isHidden = false
                showing = true
            }else {
                checkMarkImage.isHidden = true
                showing = false
            }
        }

    }
    
    //Functions -:
    func configureCell(userProfileImage image : UIImage , userEmail : String , isSelected : Bool){
        self.userProfileImage.image = image
        self.userEmailLbl.text = userEmail
        if isSelected {
            checkMarkImage.isHidden = false
        }else {
            checkMarkImage.isHidden = true
        }
    }

}
