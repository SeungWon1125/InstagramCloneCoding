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
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.masksToBounds = true
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
