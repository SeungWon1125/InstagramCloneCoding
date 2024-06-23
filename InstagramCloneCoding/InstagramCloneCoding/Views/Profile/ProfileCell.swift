//
//  ProfileCell.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/23/24.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: - Life Cycle ⭐️
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
