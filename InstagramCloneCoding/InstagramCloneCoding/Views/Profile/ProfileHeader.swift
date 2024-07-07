//
//  ProfileHeader.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/23/24.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    // MARK: - Variables
    var viewModel: ProfileHeaderViewModel? {
        didSet {
            configure()
        }
    }
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "venom-7")
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 80 / 2
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "vv0n.2ya"
        lb.text = "Loading..."
        lb.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var editProfileFollowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Edit Profile", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 3
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 0.5
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(didTapEditProfileFollowButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var postsLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.attributedText = attributedStatText(value: 0, label: "posts")
        return lb
    }()
    
    private lazy var followersLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.attributedText = attributedStatText(value: 0, label: "followers")
        return lb
    }()
    
    private lazy var followingLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.attributedText = attributedStatText(value: 0, label: "following")
                
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
        sv.distribution = .fillEqually
        return sv
    }()
    
    private let gridButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "grid"), for: .normal)
        return btn
    }()
    
    private let listButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "list"), for: .normal)
        btn.tintColor = UIColor(white: 0, alpha: 0.2)
        return btn
    }()
    
    private let bookmarkButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "ribbon"), for: .normal)
        btn.tintColor = UIColor(white: 0, alpha: 0.2)
        return btn
    }()
    
    let topDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let bottomDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        sv.distribution = .fillEqually
        return sv
    }()
    
    // MARK: - Life Cycle ⭐️
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    func setupUI() {
        backgroundColor = .systemBackground
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(editProfileFollowButton)
    
        self.addSubview(stackView)
        self.addSubview(buttonStackView)
        self.addSubview(topDivider)
        self.addSubview(bottomDivider)
        
        setupConstraints()
    }
    // MARK: - Configure
    func configure() {
        print(#function)
        guard let viewModel = viewModel else { return }
        
        // loadImage
        guard let urlString = self.viewModel?.profileImageUrl else { return }
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.profileImageView.image = UIImage(data: data)
            }
        }
        nameLabel.text = viewModel.fullName
        
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 12)
        profileImageView.setDimensions(height: 80, width: 80)
        
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: profileImageView.leftAnchor, right: profileImageView.rightAnchor, paddingTop: 12)
        
        editProfileFollowButton.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        stackView.centerY(inView: profileImageView)
        stackView.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
        
        buttonStackView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        topDivider.anchor(top: buttonStackView.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        bottomDivider.anchor(top: buttonStackView.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
    }
    
    // MARK: - Actions
    @objc func didTapEditProfileFollowButton() {
        print(#function)
    }
    
    // MARK: - Helpers
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)])
        attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return attributedText
    }
}
