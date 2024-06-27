//
//  Constants.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import Foundation
import Firebase

public struct Cell {
    static let feedCellIdentifier = "feedCell"
    static let profileCellIdentifier = "profileCell"
    static let profileHeaderIdentifier = "profileHeader"
    private init() {}
}

let COLLECTION_USERS = Firestore.firestore().collection("users")
