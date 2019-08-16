//
//  AuthVC.swift
//  BreakPoint
//
//  Created by juger rash on 09.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //Actions -:
    @IBAction func byEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: LOGINVC_STORYBOARD_IDEN)
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func loginWithFBBtnPressed(_ sender: Any) {
    }
    @IBAction func loginWithGoogleBtnPressed(_ sender: Any) {
    }
}
