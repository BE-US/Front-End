//
//  LoginVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

class LoginVC: UIViewController {
    
    let logo: UIImageView = UIImageView(image: UIImage(named: "Logo"))
    
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "이메일 주소"
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.cornerRadius = 20
        emailTextField.clearButtonMode = .whileEditing
        let emailImage = UIImage(named: "mail")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        emailTextField.addLeftImage(image: emailImage!)
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clearButtonMode = .whileEditing
        let passwordImage = UIImage(named: "key")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        passwordTextField.addLeftImage(image: passwordImage!)
        return passwordTextField
    }()
    
    func makeSubView() {
        view.addSubview(logo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
    }
    
    func makeConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 75),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEditFunc()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension LoginVC {
    
}
