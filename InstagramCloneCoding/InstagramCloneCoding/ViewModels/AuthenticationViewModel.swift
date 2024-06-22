//
//  File.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/23/24.
//

import UIKit

// 로그인에 필요한 변수들
struct LoginViewModel {
    var email: String?
    var password: String?
    
    // 계산 속성 추가
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.6940509779, green: 0.6264133711, blue: 1, alpha: 1).withAlphaComponent(0.5)
    }
    
    var ButtonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

// 회원가입에 필요한 변수들
struct RegistrationViewModel {
    
}
