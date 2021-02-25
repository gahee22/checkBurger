//
//  SettingTableViewController.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/05.
//

import UIKit

var settingTableViewCell = SettingTableViewCell()

class SettingViewController: UIViewController {
    
    //MARK: - properties
    
    var settingList = ["iCloud 백업", "암호 설정", "푸쉬 알람", "오픈소스 라이선스", "현재버전"]
    
    @IBOutlet weak var settingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.separatorStyle = .none
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}


// MARK: - Table view data source

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingTableViewCell
        cell.settingLabel.text = settingList[indexPath.row]
        
        return cell
    }
    
    
}


// MARK: - Table view delegate

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("icloud")
            
        case 1:
            print("암호")
            
        case 2:
            print("푸쉬알람")
            
        case 3:
            print("백업설정")
            
        case 4:
            let alert = UIAlertController(title: "현재 버전", message: "최신 버전입니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        default:
            print("default 값")
        }
    }
}
