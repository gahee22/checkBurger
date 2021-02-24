//
//  DailyFooterView.swift
//  Stack burger
//
//  Created by 김루희 on 2021/02/22.
//

import UIKit

class DailyFooterView: UIView {

    var backBox : UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(backBox)
        
        backBox.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        backBox.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        backBox.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        backBox.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
