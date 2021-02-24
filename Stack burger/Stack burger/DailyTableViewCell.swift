//
//  DailyTableViewCell.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/10.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoBox: UIView!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    
    @IBAction func checkButton(_ sender: UIButton) {
    
        
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(named: "btnUncheck"), for: .normal)
            todoTextField.textColor = .black
            
        } else {
            sender.isSelected = true
            sender.setImage(UIImage(named: "btnCheck"), for: .normal)
            todoTextField.textColor = .lightGray
            
        }
        
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
