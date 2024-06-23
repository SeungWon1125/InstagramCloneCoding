//
//  ResgistractionController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit
import PhotosUI

class RegistrationController : UIViewController {
    // MARK: - Variables
    private var viewModel = RegistrationViewModel()
    private var profileImage: UIImage?
    
    // MARK: - Properties
    private lazy var plusPhotoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "plus_photo"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didTapPlusPhotoButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Fullname")
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var userNameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Username")
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var signUpButton: UIButton = {
        let btn = CustomButton("Sign Up")
        btn.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle("Already have an account?", "Log In")
        btn.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Set up UI
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        setupGradientLayer()
        
        self.view.addSubview(plusPhotoButton)
        self.view.addSubview(stackView)
        self.view.addSubview(alreadyHaveAccountButton)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 120, width: 120)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: - Selectors
    @objc func handleShowLogin() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        //        print(#function)
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else {
            viewModel.userName = sender.text
        }
        
        updateForm()
    }
    
    @objc func didTapSignUpButton() {
        print(#function)
        // 텍스트필드에서 가져오는 String은 항상 Optional이기 때문에 guard let tkdyd
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credentials = AuthCredentials(email: email,
                                          password: password,
                                          fullName: fullName,
                                          userName: userName,
                                          profileImage: profileImage)
        
        AuthService.registerUser(withCredential: credentials) { error in
            if let error = error {
                print("auth 연결 실패 \(error.localizedDescription)")
                return
            }
            
            print("회원가입 성공")
        }
    }
    
    @objc func didTapPlusPhotoButton() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
}
    
// MARK: - Extension
extension RegistrationController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 캐스팅
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage // 데이터
        
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width/2
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 1
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
