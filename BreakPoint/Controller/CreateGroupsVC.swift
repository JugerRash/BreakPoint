//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by juger rash on 16.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var titleTxtField: InsetTextField!
    @IBOutlet weak var descTxtField: InsetTextField!
    @IBOutlet weak var memberTxtField: InsetTextField!
    @IBOutlet weak var memberGroupLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //Variables -:
    var emailArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        memberTxtField.delegate = self
        memberTxtField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)//this for adding a manual function for listening to the user editing
        
    }
    //Actions -:
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Functions -:
    @objc func textFieldEditingChanged(){
        if memberTxtField.text == "" {
            emailArray = []
            tableView.reloadData()
        }else {
            DataService.instance.getEmails(forSearchQuery: memberTxtField.text!) { (returnedEmailsArray) in
                self.emailArray = returnedEmailsArray
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CreateGroupsVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: USER_CELL, for: indexPath) as? UserCell else { return UITableViewCell()}
        let image = UIImage(named: USER_PROFILE_DEFAULT_IMAGE)
        cell.configureCell(userProfileImage: image!, userEmail:emailArray[indexPath.row], isSelected: true)
        return cell
    }
}
extension CreateGroupsVC : UITextFieldDelegate {
    
}
