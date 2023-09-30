//
//  LoginVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

class LoginVC: UIViewController {
    
    let logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "Logo"))
        return logo
    }()
    
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "이메일 주소"
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.cornerRadius = 20
        emailTextField.clearButtonMode = .whileEditing
        let emailImage = UIImage(named: "Mail")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        emailTextField.addLeftImage(image: emailImage!)
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clearButtonMode = .whileEditing
        let passwordImage = UIImage(named: "Key")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        passwordTextField.addLeftImage(image: passwordImage!)
        return passwordTextField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        var title = AttributedString("로그인")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
        config.attributedTitle = title
        
        loginButton.configuration = config
        return loginButton
    }()
    
    let findPasswordButton: UIButton = {
        let findPasswordButton =  UIButton()
        findPasswordButton.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        findPasswordButton.setTitleColor(UIColor(hex: "#333333"), for: .normal)
        findPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        findPasswordButton.setUnderLine()
        return findPasswordButton
    }()
    
    let easyLoginLabel: UILabel = {
        let easyLoginLabel = UILabel()
        easyLoginLabel.text = "간편 로그인"
        easyLoginLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        easyLoginLabel.font = UIFont.systemFont(ofSize: 15)
        return easyLoginLabel
    }()
    
    let easyLoginLine1: UIView = {
        let easyLoginLine1 = UIView()
        easyLoginLine1.backgroundColor = .systemGray
        return easyLoginLine1
    }()
    
    let easyLoginLine2: UIView = {
        let easyLoginLine2 = UIView()
        easyLoginLine2.backgroundColor = .systemGray
        return easyLoginLine2
    }()
    
    let naverButton: UIButton = {
        let naverButton = UIButton()
        var title = AttributedString("네이버로 간편로그인하기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .light)
        var config = UIButton.Configuration.plain()
        config.attributedTitle = title
        config.background.strokeColor = #colorLiteral(red: 0.131085664, green: 0.8754685521, blue: 0.2015054226, alpha: 1)
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        let naverimage = UIImage(named: "Naver")!.resizeImageTo(size: CGSize(width: 20, height: 20))
        config.image = naverimage
        config.imagePadding = 10
        naverButton.configuration = config
        return naverButton
    }()
    
    let signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.text = "아직 회원이 아니신가요?"
        signUpLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        signUpLabel.font = UIFont.systemFont(ofSize: 15)
        return signUpLabel
    }()
    
    let signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.setTitleColor(UIColor(hex: "#333333"), for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signUpButton.setUnderLine()
        return signUpButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEditFunc()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
    }
    
}

extension LoginVC {
    
    func makeSubView() {
        view.addSubview(logo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(findPasswordButton)
        view.addSubview(easyLoginLabel)
        view.addSubview(easyLoginLine1)
        view.addSubview(easyLoginLine2)
        view.addSubview(naverButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
    }
    
    func makeConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        findPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        easyLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        easyLoginLine1.translatesAutoresizingMaskIntoConstraints = false
        easyLoginLine2.translatesAutoresizingMaskIntoConstraints = false
        naverButton.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            findPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            findPasswordButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            findPasswordButton.widthAnchor.constraint(equalToConstant: 180),
            findPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            
            easyLoginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            easyLoginLabel.topAnchor.constraint(equalTo: findPasswordButton.bottomAnchor, constant: 70),
            
            easyLoginLine1.topAnchor.constraint(equalTo: findPasswordButton.bottomAnchor, constant: 80),
            easyLoginLine1.trailingAnchor.constraint(equalTo: easyLoginLabel.leadingAnchor, constant: -10),
            easyLoginLine1.heightAnchor.constraint(equalToConstant: 1),
            easyLoginLine1.widthAnchor.constraint(equalToConstant: 105),

            easyLoginLine2.topAnchor.constraint(equalTo: findPasswordButton.bottomAnchor, constant: 80),
            easyLoginLine2.leadingAnchor.constraint(equalTo: easyLoginLabel.trailingAnchor, constant: 10),
            easyLoginLine2.heightAnchor.constraint(equalToConstant: 1),
            easyLoginLine2.widthAnchor.constraint(equalToConstant: 105),
            
            naverButton.topAnchor.constraint(equalTo: easyLoginLabel.bottomAnchor, constant: 20),
            naverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            naverButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            naverButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -19),
        ])
    }
    
    func makeAddTarget() {
        self.signUpButton.addTarget(self, action: #selector(goToSignUpVC(_:)), for: .touchUpInside)
    }
    
    @objc func goToSignUpVC(_: UIButton) {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
}
