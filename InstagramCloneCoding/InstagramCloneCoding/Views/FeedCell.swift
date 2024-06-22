//
//  FeedCell.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
