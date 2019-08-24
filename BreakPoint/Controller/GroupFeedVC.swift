//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by juger rash on 22.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {
    
    //Outlets -:
    @IBOutlet weak var groupTitleLbl : UILabel!
    @IBOutlet weak var membersLbl : UILabel!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var messageTxtField: InsetTextField!
    @IBOutlet weak var sendBtn : UIButton!
    @IBOutlet weak var sendBtnView : UIView!	
    
    //Variables -:
    var group : Group?
    var groupMessages = [Message]()	
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        sendBtnView.bindToKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmails(forGroup : group!) { (returnedGroupsMembers) in
            self.membersLbl.text = returnedGroupsMembers.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroupMessages(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1 , section: 0), at: .bottom, animated: true)
                }
                
            })
        }
        
        
    }
    //Actions _:
    @IBAction func backBtnPressed(_ sender : Any) {
        dismissDetail()
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTxtField.text != "" {
            messageTxtField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTxtField.text!, andUID: Auth.auth().currentUser!.uid, andGroupKey: group?.groupKey) { (success) in
                if success {
                    self.messageTxtField.text = ""
                    self.sendBtn.isEnabled = true
                    self.messageTxtField.isEnabled = true
                }
            }
        }
    }
    
    //Functions -:
    func initData(froGroup group : Group ) {
        self.group = group
    }
    
}

extension GroupFeedVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_FEED_CELL, for: indexPath) as? GroupFeedCell else {
            return UITableViewCell()
        }
        let image = UIImage(named: USER_PROFILE_DEFAULT_IMAGE)
        let uid = groupMessages[indexPath.row].senderId
        DataService.instance.getUsername(forUID: uid) { (email) in
            cell.configureCell(image: image!, email: email, content: self.groupMessages[indexPath.row].content)
        }
        
        return cell
    }
}
