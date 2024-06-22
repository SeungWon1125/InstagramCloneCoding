//
//  LoginController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Instagram_logo_white")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        btn.setHeight(50)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return btn
    }()
    
    private let forgotPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle("Forgot your password", "Get help signing in.")
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    private let dontHaveAccoutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle("Don't have an account? ", "Sign Up")
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
        
    }
    
    // MARK: - Set up Navigation Bar
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        // 그라디언트
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor] // 그라디언트 사용 시 마지막에 .cgColor 붙여야 함
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        self.view.addSubview(iconImage)
        self.view.addSubview(stackView)
        self.view.addSubview(dontHaveAccoutButton)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        dontHaveAccoutButton.centerX(inView: view)
        dontHaveAccoutButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
