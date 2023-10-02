//
//  SignUpVC3.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/1/23.
//

import UIKit

class SignUpVC3: UIViewController {
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return passwordLabel
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "비밀번호()를 입력해주세요. (8~12자)"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.addLeftPadding()
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let passwordCheckTextField: UITextField = {
        let passwordCheckTextField = UITextField()
        passwordCheckTextField.placeholder = "다시 한번 입력해주세요."
        passwordCheckTextField.backgroundColor = .systemGray6
        passwordCheckTextField.layer.cornerRadius = 20
        passwordCheckTextField.clearButtonMode = .whileEditing
        passwordCheckTextField.addLeftPadding()
        passwordCheckTextField.isSecureTextEntry = true
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
        handleEdit()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
    }
}

extension SignUpVC3 {
    
    func makeSubView() {
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordCheckTextField)
        view.addSubview(signUpButton)
    }
    
    func makeConstraint() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
        self.signUpButton.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
    }
    
    func passwordValid() -> Bool {
        if passwordTextField.text != "" && passwordTextField.text!.count >= 8 && passwordTextField.text!.count <= 12 && passwordTextField.text == passwordCheckTextField.text {
            UserDefaults.standard.set(passwordTextField.text, forKey: "Password")
            return true
        }
        return false
    }
    
    @objc func signUp(_: UIButton) {
        if passwordValid() != true {
            showAlert(message: "비밀번호를 다시 확인해주세요.")
            return
        }
        self.navigationController?.pushViewController(SignUpSuccessVC(), animated: true)
    }
    
}
