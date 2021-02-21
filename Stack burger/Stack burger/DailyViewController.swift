//
//  DailyViewController.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/10.
//

import UIKit

var dailyTableViewCell = DailyTableViewCell()
class DailyViewController: UIViewController {

    @IBOutlet weak var dailyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dailyTableView.delegate = self
        dailyTableView.dataSource = self
        
        dailyTableView.separatorStyle = .none
        
    }
    



}

//MARK: - Extension

extension DailyViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyTableViewCell
       
        return cell
    }
    
    

}

extension DailyViewController: UITableViewDelegate {
    
}
