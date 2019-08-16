//
//  MeVC.swift
//  BreakPoint
//
//  Created by juger rash on 15.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmailLbl.text = Auth.auth().currentUser?.email
    }
    //Actions -:
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure that you want to logout ?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: AUTHVC_STORYBOARD_IDEN) as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
}
