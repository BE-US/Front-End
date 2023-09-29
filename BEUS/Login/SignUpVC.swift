//
//  SignUpVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 9/28/23.
//

import UIKit

class SignUpVC: UIViewController {
    
    let nickNameLabel: UILabel = {
        let nickNameLabel = UILabel()
        nickNameLabel.text = "닉네임"
        nickNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return nickNameLabel
    }()
    
    let nickNameTextField: UITextField = {
        let nickNameTextField = UITextField()
        nickNameTextField.placeholder = "사용할 닉네임을 입력해주세요."
        nickNameTextField.backgroundColor = .systemGray6
        nickNameTextField.layer.cornerRadius = 20
        nickNameTextField.clearButtonMode = .whileEditing
        nickNameTextField.addLeftPadding()
        return nickNameTextField
    }()
    
    let nickNameCheckButton: UIButton = {
        let nickNameCheckButton = UIButton()
        var title = AttributedString("중복 확인")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        nickNameCheckButton.configuration = config
        nickNameCheckButton.addTarget(self, action: #selector(nickNameCheck(_:)), for: .touchUpInside)
        return nickNameCheckButton
    }()
    
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "이메일"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return emailLabel
    }()
    
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "사용할 이메일을 입력해주세요."
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.cornerRadius = 20
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.addLeftPadding()
        return emailTextField
    }()
    
    let sendCodeButton: UIButton = {
        let sendCodeButton = UIButton()
        var title = AttributedString("이메일로 인증코드 보내기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.cornerStyle = .capsule
        sendCodeButton.configuration = config
        return sendCodeButton
    }()
    
    let codeTextField: UITextField = {
        let codeTextField = UITextField()
        codeTextField.placeholder = "인증코드를 입력해주세요."
        codeTextField.backgroundColor = .systemGray6
        codeTextField.layer.cornerRadius = 20
        codeTextField.clearButtonMode = .whileEditing
        codeTextField.addLeftPadding()
        return codeTextField
    }()
    
    let codeCheckButton: UIButton = {
        let codeCheckButton = UIButton()
        var title = AttributedString("코드 확인")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        codeCheckButton.configuration = config
        return codeCheckButton
    }()
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return passwordLabel
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "비밀번호를 입력해주세요."
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.addLeftPadding()
        return passwordTextField
    }()
    
    let passwordCheckTextField: UITextField = {
        let passwordCheckTextField = UITextField()
        passwordCheckTextField.placeholder = "다시 한번 입력해주세요."
        passwordCheckTextField.backgroundColor = .systemGray6
        passwordCheckTextField.layer.cornerRadius = 20
        passwordCheckTextField.clearButtonMode = .whileEditing
        passwordCheckTextField.addLeftPadding()
        return passwordCheckTextField
    }()
    
    let signUpButton: UIButton = {
        let signUpButton = UIButton()
        var title = AttributedString("가입하기")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.cornerStyle = .capsule
        config.attributedTitle = title
        signUpButton.tintColor = .white
        signUpButton.configuration = config
        return signUpButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEditFunc()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
}

extension SignUpVC {
    
    func makeSubView() {
        view.addSubview(nickNameLabel)
        view.addSubview(nickNameTextField)
        view.addSubview(nickNameCheckButton)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(sendCodeButton)
        view.addSubview(codeTextField)
        view.addSubview(codeCheckButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordCheckTextField)
        view.addSubview(signUpButton)
    }
    
    func makeConstraint() {
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nickNameCheckButton.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        sendCodeButton.translatesAutoresizingMaskIntoConstraints = false
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        codeCheckButton.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nickNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nickNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            nickNameTextField.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 10),
            nickNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nickNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            nickNameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            nickNameCheckButton.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 10),
            nickNameCheckButton.leadingAnchor.constraint(equalTo: nickNameTextField.trailingAnchor, constant: 5),
            nickNameCheckButton.heightAnchor.constraint(equalToConstant: 45),
            
            emailLabel.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            sendCodeButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            sendCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sendCodeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            sendCodeButton.heightAnchor.constraint(equalToConstant: 45),
            
            codeTextField.topAnchor.constraint(equalTo: sendCodeButton.bottomAnchor, constant: 10),
            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            codeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            codeTextField.heightAnchor.constraint(equalToConstant: 45),
            
            codeCheckButton.topAnchor.constraint(equalTo: sendCodeButton.bottomAnchor, constant: 10),
            codeCheckButton.leadingAnchor.constraint(equalTo: codeTextField.trailingAnchor, constant: 5),
            codeCheckButton.heightAnchor.constraint(equalToConstant: 45),
            
            passwordLabel.topAnchor.constraint(equalTo: codeCheckButton.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordCheckTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordCheckTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordCheckTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordCheckTextField.heightAnchor.constraint(equalToConstant: 45),
            
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.nickNameCheckButton.addTarget(self, action: #selector(nickNameCheck(_:)), for: .touchUpInside)
        self.sendCodeButton.addTarget(self, action: #selector(sendCode(_:)), for: .touchUpInside)
        self.codeCheckButton.addTarget(self, action: #selector(codeChcek(_:)), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
    }
    
    @objc func nickNameCheck(_: UIButton) {
        
    }
    
    @objc func sendCode(_: UIButton) {
        
    }
    
    @objc func codeChcek(_: UIButton) {
        
    }
    
    @objc func signUp(_: UIButton) {
        
    }
    
}
