//
//  DailyViewController.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/10.
//

import UIKit

var dailyTableViewCell = DailyTableViewCell()
var dailyFooterView = DailyFooterView()

class DailyViewController: UIViewController {

    //MARK: - properties
    
    var toDoList = ["밥먹기", "잠자기", "이사짐 택배 보내기", "다이어트 준비하기", "넷플릭스에서 러브 아일랜드 보기", "복학 신청 취소하기"]
    
    var titleLabel : String = ""
    
    @IBOutlet weak var dailyTitleLabel: UILabel!
    @IBOutlet weak var dailyTableView: UITableView!
        
  
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dailyTableView.delegate = self
        dailyTableView.dataSource = self
        
        dailyTableView.separatorStyle = .none
        dailyTableView.allowsSelection = false
        
        dailyTitleLabel.text = titleLabel
        
        
        // 키보드 영역 밖을 선택 시 키보드 내려가기
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        footer.backgroundColor = .red
        
        dailyTableView.tableFooterView = footer
        
        

        let backBox = UIView()
        backBox.backgroundColor = .lightGray
        backBox.layer.cornerRadius = 2
        
        backBox.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        footer.addSubview(backBox)
       
   
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.pushViewController(MontlyViewController(), animated: true)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "할 일 작성해 주세요", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { (action) in
            
            if textField.text != "" {
                self.toDoList.append(textField.text!)
                self.dailyTableView.reloadData()
            } else {
                print("할 일을 따로 안 적었으니 그냥 alert 창 닫자..")
            }
        }))
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "ex. iOS 개발 공부하기"
            textField = alertTextField
        }
        

        
        present(alert, animated: true, completion: nil)
        
        
    }
    


}

//MARK: - Extension

extension DailyViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "🍔 Stack today's burger"
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        35
//    }
//
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .orange
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.textColor = .white
//        header.textLabel?.textAlignment = .left
//
//        header.textLabel?.font = UIFont(name: "UhBee Se_hyun", size: 13)
//    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "🍔 Stack your life 🍔"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .white
        let footer = view as! UITableViewHeaderFooterView
        footer.textLabel?.textColor = .orange
        footer.textLabel?.textAlignment = .center
        footer.textLabel?.font = UIFont(name: "UhBee Se_hyun", size: 15)
    
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyTableViewCell
        cell.todoTextField.text = toDoList[indexPath.row]
        cell.todoBox.layer.cornerRadius = 5
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "완료") { (action, view, completion) in
            self.toDoList.remove(at: indexPath.row)
            self.dailyTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            completion(true)
        }
        
        delete.backgroundColor = .orange
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    

}

extension DailyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
