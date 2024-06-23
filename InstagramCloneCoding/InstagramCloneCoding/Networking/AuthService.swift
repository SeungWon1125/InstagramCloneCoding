//
//  AuthService.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/23/24.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}

struct AuthService {
    static func logUserIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(authResult, error)
        }
    }
    
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        print("Credentials are \(credentials)")
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in // 이미지를 업로드 하고 끝나면 클로저로 이미지url 받음
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in // firebase코드
                if let error = error {
                    print("회원가입 실패 \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return } // 사람마다 각자 고유 번호 (firebase uid)
                
                // firebase에 보낼 딕셔너리 생성
                let data: [String: Any] = ["email": credentials.email,
                                           "fullName": credentials.fullName,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "userName": credentials.userName]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
