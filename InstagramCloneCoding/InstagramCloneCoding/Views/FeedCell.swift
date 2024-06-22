//
//  FeedCell.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "venom-7")
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("venom", for: .normal)
        btn.setTitleColor(.label, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        btn.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return btn
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "like_unselected"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var commentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "comment"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "send2"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private let likesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1 like"
        lb.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return lb
    }()
    
    private let captionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "some text caption for now.."
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private let postTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "2 days ago"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lb.textColor = .lightGray
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // 이미지 원형으로 자르기
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(profileImageView)
        self.addSubview(usernameButton)
        self.addSubview(postImageView)
        
        self.addSubview(stackView)
        
        self.addSubview(likesLabel)
        self.addSubview(captionLabel)
        self.addSubview(postTimeLabel)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        
        // stackView
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
        
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    @objc func didTapUsername() {
        print(#function)
    }
}
