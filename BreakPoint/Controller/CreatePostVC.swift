//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by juger rash on 15.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtn.isEnabled = true
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmailLbl.text = Auth.auth().currentUser?.email
    }
    //Actions -:
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textView.text != "" && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, andUID: Auth.auth().currentUser!.uid, andGroupKey: nil) { (success) in
                if success {
                    print("Successfully send the feed")
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.sendBtn.isEnabled = true
                    print("There was an error")
                }
            }
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//Extensions -:
extension CreatePostVC : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
