//
//  GroupsVC.swift
//  BreakPoint
//
//  Created by juger rash on 07.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var tableView: UITableView!
    
    //Variables -:
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups(handler: { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.tableView.reloadData()
            })
        }
    }
}

extension GroupsVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL, for: indexPath) as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle , description: group.groupDesc, numMembers: group.groupMembersCount)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let  groupFeedVC = storyboard?.instantiateViewController(withIdentifier: GROUP_FEED_VC) as? GroupFeedVC else { return }
        let group = groupsArray[indexPath.row]
        groupFeedVC.initData(froGroup: group)
        presentDetail(groupFeedVC)
    }
    
}
