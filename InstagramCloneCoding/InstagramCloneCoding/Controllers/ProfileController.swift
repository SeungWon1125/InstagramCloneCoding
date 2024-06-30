//
//  ProfileController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class ProfileController: UIViewController {
    // MARK: - Variables
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var user: User? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        fetchUser()
        setupCollectionView()
        setupNavigationBar()
    }
    // MARK: - API
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
            self.navigationItem.title = user.userName
        }
    }
    
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .systemPink
        navigationItem.title = "Loading..."
    }
    
    // MARK: - Set up CollectionView
    func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        
        // 셀, 헤더뷰 등록
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: Cell.profileCellIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Cell.profileHeaderIdentifier)
        
        // collectionView 대리자 설정
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionViewConstraints()
    }
    
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
}

// MARK: - CollectionView DataSource
extension ProfileController: UICollectionViewDataSource {
    // 셀 구성 요소
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.profileCellIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    
    // 콜렉션 뷰 헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Cell.profileHeaderIdentifier, for: indexPath) as! ProfileHeader
        
        print("user fetching start..")
        
        if let user = user {
            header.viewModel = ProfileHeaderViewModel(user: user)
        } else {
            print("아직 user정보가 없습니다.")
        }
        return header
    }
}
// MARK: - CollectionView Delegate
// 아이템 선택시 반응
extension ProfileController: UICollectionViewDelegate {
    
}


// MARK: - CollectionView Delegate Flow Layout
// 콜렉션 뷰 사이즈 결정
extension ProfileController: UICollectionViewDelegateFlowLayout {
    // 양 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 컬렉션 아이템(셀) 사이즈 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 1 - 1) / 3 // 3개의 컬랙션 뷰가 한 줄에 있을 거니까 2개의 빈칸 빼고, 가로를 3으로 나누기
        return CGSize(width: width, height: width)
    }
    
    // 헤더 뷰 사이즈 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
