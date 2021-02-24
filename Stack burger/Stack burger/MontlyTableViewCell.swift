//
//  MontlyTableViewCell.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/22.
//

import UIKit

class MontlyTableViewCell: UITableViewCell {


    var cellLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "UhBee Se_hyun", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var cellBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var cellImageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "goimg")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(cellBackView)
        addSubview(cellLabel)
        addSubview(cellImageView)
        
        cellBackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        cellBackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        cellBackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cellBackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        cellLabel.leftAnchor.constraint(equalTo: cellBackView.leftAnchor, constant: 18).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: cellBackView.rightAnchor, constant: -34).isActive = true
        cellLabel.topAnchor.constraint(equalTo: cellBackView.topAnchor, constant: 11).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: cellBackView.bottomAnchor, constant: -11).isActive = true
        
        cellImageView.rightAnchor.constraint(equalTo: cellBackView.rightAnchor, constant: -17).isActive = true
        cellImageView.centerXAnchor.constraint(equalTo: cellImageView.centerXAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: cellBackView.topAnchor, constant: 20).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: cellBackView.bottomAnchor, constant: -20).isActive = true

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
