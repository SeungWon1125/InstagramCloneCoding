//
//  CustomButton.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class CustomButton: UIButton {
    
    init(_ buttonTitle: String) {
        super.init(frame: .zero)
        setTitle("Log In", for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        backgroundColor = #colorLiteral(red: 0.6940509779, green: 0.6264133711, blue: 1, alpha: 1).withAlphaComponent(0.5)
        layer.masksToBounds = true
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        isEnabled = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
