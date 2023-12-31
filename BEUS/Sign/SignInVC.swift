//
//  SignInVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

class SignInVC: UIViewController {
    
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
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let signInButton: UIButton = {
        let signInButton = UIButton()
        var title = AttributedString("로그인")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
        config.attributedTitle = title
        
        signInButton.configuration = config
        return signInButton
    }()
    
    let changePasswordButton: UIButton = {
        let changePasswordButton =  UIButton()
        changePasswordButton.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        changePasswordButton.setTitleColor(UIColor(hex: "#333333"), for: .normal)
        changePasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        changePasswordButton.setUnderLine()
        return changePasswordButton
    }()
    
    let easySignInLabel: UILabel = {
        let easySignInLabel = UILabel()
        easySignInLabel.text = "간편 로그인"
        easySignInLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        easySignInLabel.font = UIFont.systemFont(ofSize: 15)
        return easySignInLabel
    }()
    
    let easySignInLine1: UIView = {
        let easySignInLine1 = UIView()
        easySignInLine1.backgroundColor = .systemGray
        return easySignInLine1
    }()
    
    let easySignInLine2: UIView = {
        let easySignInLine2 = UIView()
        easySignInLine2.backgroundColor = .systemGray
        return easySignInLine2
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
        handleEdit()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
    }
    
}

extension SignInVC {
    
    func makeSubView() {
        view.addSubview(logo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(changePasswordButton)
        view.addSubview(easySignInLabel)
        view.addSubview(easySignInLine1)
        view.addSubview(easySignInLine2)
        view.addSubview(naverButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
    }
    
    func makeConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        easySignInLabel.translatesAutoresizingMaskIntoConstraints = false
        easySignInLine1.translatesAutoresizingMaskIntoConstraints = false
        easySignInLine2.translatesAutoresizingMaskIntoConstraints = false
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
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            changePasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            changePasswordButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            changePasswordButton.widthAnchor.constraint(equalToConstant: 180),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 20),
            
            easySignInLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            easySignInLabel.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 70),
            
            easySignInLine1.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 80),
            easySignInLine1.trailingAnchor.constraint(equalTo: easySignInLabel.leadingAnchor, constant: -10),
            easySignInLine1.heightAnchor.constraint(equalToConstant: 1),
            easySignInLine1.widthAnchor.constraint(equalToConstant: 105),

            easySignInLine2.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 80),
            easySignInLine2.leadingAnchor.constraint(equalTo: easySignInLabel.trailingAnchor, constant: 10),
            easySignInLine2.heightAnchor.constraint(equalToConstant: 1),
            easySignInLine2.widthAnchor.constraint(equalToConstant: 105),
            
            naverButton.topAnchor.constraint(equalTo: easySignInLabel.bottomAnchor, constant: 20),
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
        self.changePasswordButton.addTarget(self, action: #selector(goToChangePasswordVC1(_:)), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(goToSignUpVC1(_:)), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
    }
    
    func emailValid() -> Bool {
        if emailTextField.text != "" && emailTextField.text!.contains("@") {
            return true
        }
        return false
    }
    
    func passwordValid() -> Bool {
        if passwordTextField.text != "" {
            return true
        }
        return false
    }
    
    @objc func goToChangePasswordVC1(_: UIButton) {
        self.navigationController?.pushViewController(ChangePasswordVC1(), animated: true)
    }
    
    @objc func goToSignUpVC1(_: UIButton) {
        self.navigationController?.pushViewController(SignUpVC1(), animated: true)
    }
    
    @objc func signIn(_: UIButton) {
        if !emailValid() {
            showAlert(message: "이메일을 다시 확인해주세요.")
            return
        }
        if !passwordValid() {
            showAlert(message: "비밀번호를 다시 확인해주세요.")
            return
        }
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
}
