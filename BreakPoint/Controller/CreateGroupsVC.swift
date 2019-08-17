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
    @IBOutlet weak var doneBtn: UIButton!
    
    //Variables -:
    var emailArray = [String]()
    var chosenUsersEmail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        memberTxtField.delegate = self
        memberTxtField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)//this for adding a manual function for listening to the user editing
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        doneBtn.isEnabled = false
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
        if chosenUsersEmail.contains(emailArray[indexPath.row]){
            cell.configureCell(userProfileImage: image!, userEmail:emailArray[indexPath.row], isSelected: true)
        }else {
            cell.configureCell(userProfileImage: image!, userEmail:emailArray[indexPath.row], isSelected: false)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUsersEmail.contains(cell.userEmailLbl.text!) {
            chosenUsersEmail.append(cell.userEmailLbl.text!)
            memberGroupLbl.text = chosenUsersEmail.joined(separator: ", ")
            doneBtn.isEnabled = true
        }else {
            chosenUsersEmail = chosenUsersEmail.filter({ $0 != cell.userEmailLbl.text!})
            if chosenUsersEmail.count >= 1 {
                memberGroupLbl.text = chosenUsersEmail.joined(separator: ", ")
            }else {
                memberGroupLbl.text = "add some people to your group"
                doneBtn.isEnabled = false
            }
        }
    }
}
extension CreateGroupsVC : UITextFieldDelegate {
    
}
