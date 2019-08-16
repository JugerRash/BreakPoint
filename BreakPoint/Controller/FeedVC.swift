//
//  FeedVC.swift
//  BreakPoint
//
//  Created by juger rash on 07.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var tableView: UITableView!
    var allMesages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessageArray) in
            self.allMesages = returnedMessageArray.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMesages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Feed_CELL, for: indexPath) as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let senderId = allMesages[indexPath.row].senderId
        let content = allMesages[indexPath.row].content
        DataService.instance.getUsername(forUID : senderId) { (returnedUserEmail) in
            cell.configureCell(profileImage: image!, email: returnedUserEmail, messageContent: content)
        }
        
        
        return cell
    }
}

