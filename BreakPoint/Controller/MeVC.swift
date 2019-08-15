//
//  MeVC.swift
//  BreakPoint
//
//  Created by juger rash on 15.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Actions -:
    @IBAction func logoutBtnPressed(_ sender: Any) {
    }
}
