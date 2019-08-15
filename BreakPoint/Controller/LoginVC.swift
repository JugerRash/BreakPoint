//
//  LoginVC.swift
//  BreakPoint
//
//  Created by juger rash on 09.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var emailTxtField: InsetTextField!
    @IBOutlet weak var passwordTxtField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    //Actions -:
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailTxtField.text != nil && passwordTxtField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTxtField.text!, andPassword: passwordTxtField.text!) { (success, loginError) in
                if success {
                    print("Successfully logged in")
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print(String(loginError!.localizedDescription))
                }
            }
            
            AuthService.instance.registerUser(withEmail: emailTxtField.text!, andPassword: passwordTxtField.text!) { (success, registrationError) in
                if success {
                    AuthService.instance.loginUser(withEmail: self.emailTxtField.text! , andPassword: self.passwordTxtField.text!, loginComplete: { (success, loginError) in
                        if success {
                            print("Successfully logged in ")
                        }
                    })
                    print("registed user")
                    self.dismiss(animated: true, completion: nil)
                    
                }else {
                    print(String(registrationError!.localizedDescription))
                }
            }
            
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//Extensions -:
extension LoginVC : UITextFieldDelegate {
    
}
