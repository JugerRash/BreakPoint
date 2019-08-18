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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension GroupsVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL, for: indexPath) as? GroupCell else { return UITableViewCell() }
        cell.configureCell(title: "Hello World!", description: "group for programmers", numMembers: 4)
        return cell
    }
}
