//
//  FeedController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class FeedController: UICollectionViewController {
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
    }
    
    // MARK: - Set up CollectionView
    func setupCollectionView() {
        // 셀 등록
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cell.feedCellIdentifier)
    }
    
    // MARK: - Set up UI
    func setupUI() {
        collectionView.backgroundColor = .systemBackground
    }
}

// MARK: - UICollectionViewDataSource
// UICollectionViewController를 위에서 이미 채택하고 있기 때문에
// 여기서 UICollectionViewDataSource를 채택하지 않아도 된다.
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.feedCellIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    // 셀의 사이즈를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = view.frame.width
        return CGSize(width: widthSize, height: 200)
    }
}
