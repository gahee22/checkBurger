//
//  SettingTableViewCell.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/10.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        settingLabel.font = UIFont(name: "UhBee Se_hyun", size: 13)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
