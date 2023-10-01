//
//  SignUpVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 9/28/23.
//

import UIKit

class SignUpVC1: UIViewController {
    
    var emailValid: Bool = true
    
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
    
    let nextButton: UIButton = {
        let nextButton = UIButton()
        var title = AttributedString("다음")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.cornerStyle = .capsule
        config.attributedTitle = title
        nextButton.tintColor = .white
        nextButton.configuration = config
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEdit()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
        navigationController?.isNavigationBarHidden = false
    }
}

extension SignUpVC1 {
    
    func makeSubView() {
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(sendCodeButton)
        view.addSubview(codeTextField)
        view.addSubview(codeCheckButton)
        view.addSubview(nextButton)
    }
    
    func makeConstraint() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        sendCodeButton.translatesAutoresizingMaskIntoConstraints = false
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        codeCheckButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.sendCodeButton.addTarget(self, action: #selector(sendCode(_:)), for: .touchUpInside)
        self.codeCheckButton.addTarget(self, action: #selector(codeChcek(_:)), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
    }
    
    @objc func sendCode(_: UIButton) {
        
    }
    
    @objc func codeChcek(_: UIButton) {
        
    }
    
    @objc func next(_: UIButton) {
        if emailValid != true {
            showAlert(message: "이메일을 다시 확인해주세요.")
            return
        }
        self.navigationController?.pushViewController(SignUpVC2(), animated: true)
    }
    
}
