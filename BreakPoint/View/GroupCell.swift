//
//  GroupCell.swift
//  BreakPoint
//
//  Created by juger rash on 18.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    //Outlets -:
    @IBOutlet weak var groupTitleLbl : UILabel!
    @IBOutlet weak var groupDescrLbl : UILabel!
    @IBOutlet weak var groupNumMembersLbl : UILabel!
    
    //Functions -:
    func configureCell(title : String , description : String , numMembers : Int){
        self.groupTitleLbl.text = title
        self.groupDescrLbl.text = description
        self.groupNumMembersLbl.text = "\(numMembers) members"
    }
}
