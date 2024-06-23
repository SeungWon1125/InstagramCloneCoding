//
//  FeedController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit
import Firebase

class FeedController: UICollectionViewController {
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
        setupNavigationBar()
    }
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogoutButton))
        navigationItem.title = "Feed"
    }
    
    
    // MARK: - Set up CollectionView
    func setupCollectionView() {
        // 셀 등록
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: Cell.feedCellIdentifier)
    }
    
    // MARK: - Set up UI
    func setupUI() {
        collectionView.backgroundColor = .systemBackground
    }
    
    // MARK: - Selectors
    @objc func didTapLogoutButton() {
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("로그아웃 실패")
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.feedCellIdentifier, for: indexPath) as! FeedCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    // 셀의 사이즈를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthSize = view.frame.width
        var heightSize = widthSize + 8 + 40 + 8 // 프사 위 패딩 + 프사 높이 + 프사 아래 패딩
        heightSize += 50 // 포스트 이미지 뷰 높이
        heightSize += 60 // 나머지 아래 높이
        
        return CGSize(width: widthSize, height: heightSize)
    }
}
