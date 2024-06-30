//
//  ProfileHeaderViewModel.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/30/24.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullName: String {
        return user.fullName
    }
    
    var profileImageUrl: String {
        return user.profileImageUrl
    }
    
    init(user: User) {
        self.user = user
    }
}
