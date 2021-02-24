//
//  MontlyViewController.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/22.
//

import UIKit

var montlyTableViewCell = MontlyTableViewCell()

class MontlyViewController: UIViewController {

    
    //MARK: - properties
    
    var list = ["2021/02/23 할 일"]
    
    
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: - lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(MontlyTableViewCell.self, forCellReuseIdentifier: "montlyCell")
        
        tableView.separatorStyle = .none
    }
    
    @IBAction func backButton(_ sender: UIButton) {
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "리스트 이름을 작성해 주세요", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { (action) in
            
            if textField.text != "" {
                self.list.append(textField.text!)
                self.tableView.reloadData()
            } else {
                print("할 일을 따로 안 적었으니 그냥 alert 창 닫자..")
            }
        }))
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "ex. 오늘 할 일들"
            textField = alertTextField
        }
        

        
        present(alert, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let dailyVC = segue.destination as? DailyViewController else {
//            return
//        }
//
//        dailyVC.titleLabel = montlyTableViewCell.cellLabel.text ?? "안돼"
//        print(#function)
//        print(montlyTableViewCell.cellLabel.text)
//        print(dailyVC.titleLabel)
//    }
//    

}

//MARK: - extension

extension MontlyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list.count == 0 {
            emptyImage.isHidden = false
        } else {
            emptyImage.isHidden = true
        }
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "montlyCell", for: indexPath) as! MontlyTableViewCell
        cell.cellLabel.text = "🍔  \(list[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "삭제") { (action, view, completion) in
            self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        delete.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [delete])
    }

    
}

extension MontlyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "showDailyView", sender: indexPath.row)
////        print("\(indexPath.row)")
//        print(#function)
        print(#line)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "dailyVC") as! DailyViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.titleLabel = list[indexPath.row]
        print(#line)
        
        print(#function)
    }
}
