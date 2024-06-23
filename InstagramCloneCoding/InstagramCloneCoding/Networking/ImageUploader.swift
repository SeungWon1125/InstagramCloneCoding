//
//  ImageUploader.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/23/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) { // 컴플리션헨들러로 다운로드 url을 던져준다.
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return } // 업로드 데이터
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)") // firebase에 업로드할 이름
        
        ref.putData(imageData, metadata: nil) { (metaData, error) in
            if let error = error {
                print("이미지 업로드 실패 \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl) // 다운로드 이미지 url
            }
        }
    }
}
