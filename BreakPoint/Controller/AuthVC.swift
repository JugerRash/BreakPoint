//
//  AuthVC.swift
//  BreakPoint
//
//  Created by juger rash on 09.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func byEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: LOGINVC_STORYBOARD_IDEN)
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func loginWithFBBtnPressed(_ sender: Any) {
    }
    @IBAction func loginWithGoogleBtnPressed(_ sender: Any) {
    }
}
