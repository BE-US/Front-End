//
//  FindPasswordVC2.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/2/23.
//

import UIKit

class ChangePasswordVC2: UIViewController {
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return passwordLabel
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "비밀번호를 입력해주세요. (8~12자)"
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
    
    let changePasswordButton: UIButton = {
        let changePasswordButton = UIButton()
        var title = AttributedString("가입하기")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.cornerStyle = .capsule
        config.attributedTitle = title
        changePasswordButton.tintColor = .white
        changePasswordButton.configuration = config
        return changePasswordButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEdit()
        view.backgroundColor = .white
        self.title = "비밀번호 변경(2/2)"
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
    }
}

extension ChangePasswordVC2 {
    
    func makeSubView() {
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordCheckTextField)
        view.addSubview(changePasswordButton)
    }
    
    func makeConstraint() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckTextField.translatesAutoresizingMaskIntoConstraints = false
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            changePasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 50),
            changePasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            changePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.changePasswordButton.addTarget(self, action: #selector(changePassword(_:)), for: .touchUpInside)
    }
    
    func passwordValid() -> Bool {
        if passwordTextField.text != "" && passwordTextField.text!.count >= 8 && passwordTextField.text!.count <= 12 && passwordTextField.text == passwordCheckTextField.text {
            UserDefaults.standard.set(passwordTextField.text, forKey: "Password")
            return true
        }
        return false
    }
    
    @objc func changePassword(_: UIButton) {
        if passwordValid() != true {
            showAlert(message: "비밀번호를 다시 확인해주세요.")
            return
        }
        self.navigationController?.pushViewController(ChangePasswordSuccessVC(), animated: true)
    }
    
}
