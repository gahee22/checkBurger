//
//  SettingTableViewController.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/05.
//

import UIKit

class SettingViewController: UIViewController {

    var settingList = ["iCloud 백업", "암호 설정", "푸쉬 알람", "오픈소스 라이선스", "현재버전"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

    
}

// MARK: - Table view data source
extension SettingViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingTableViewCell
        cell

        

        return cell
    }

}


// MARK: - Table view delegate

extension SettingViewController {
    
}
