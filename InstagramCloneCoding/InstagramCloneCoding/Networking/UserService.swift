//
//  UserService.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/27/24.
//

import Foundation
import Firebase

struct UserService {
    static func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            //
            print(snapshot?.data())
        }
    }
}
