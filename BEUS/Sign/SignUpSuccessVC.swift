//
//  SignUpSuccessVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 9/30/23.
//

import UIKit

class SignUpSuccessVC: UIViewController {
    
    let checkImageView: UIImageView = {
        let checkImageView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)])
        checkImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        return checkImageView
    }()
    
    let signUpSuccessLabel1: UILabel = {
        let signUpSuccessLabel1 = UILabel()
        signUpSuccessLabel1.text = "환영합니다!"
        signUpSuccessLabel1.textAlignment = .center
        signUpSuccessLabel1.font = UIFont.boldSystemFont(ofSize: 25)
        return signUpSuccessLabel1
    }()
    
    let signUpSuccessLabel2: UILabel = {
        let signUpSuccessLabel2 = UILabel()
        signUpSuccessLabel2.text = "회원가입이 완료되었습니다."
        signUpSuccessLabel2.textAlignment = .center
        signUpSuccessLabel2.font = UIFont.systemFont(ofSize: 20)
        return signUpSuccessLabel2
    }()
    
    let startButton: UIButton = {
        let startButton = UIButton()
        var title = AttributedString("로그인 화면으로 돌아가기")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
        config.cornerStyle = .capsule
        config.attributedTitle = title
        startButton.tintColor = .white
        startButton.configuration = config
        return startButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension SignUpSuccessVC {
    
    func makeSubView() {
        view.addSubview(checkImageView)
        view.addSubview(signUpSuccessLabel1)
        view.addSubview(signUpSuccessLabel2)
        view.addSubview(startButton)
    }
    
    func makeConstraint() {
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpSuccessLabel1.translatesAutoresizingMaskIntoConstraints = false
        signUpSuccessLabel2.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkImageView.widthAnchor.constraint(equalToConstant: 90),
            checkImageView.heightAnchor.constraint(equalToConstant: 90),
            
            signUpSuccessLabel1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpSuccessLabel1.topAnchor.constraint(equalTo: checkImageView.bottomAnchor, constant: 20),
            signUpSuccessLabel1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpSuccessLabel1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            signUpSuccessLabel2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpSuccessLabel2.topAnchor.constraint(equalTo: signUpSuccessLabel1.bottomAnchor, constant: 5),
            signUpSuccessLabel2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpSuccessLabel2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.startButton.addTarget(self, action: #selector(goToSignInVC(_:)), for: .touchUpInside)
    }
    
    @objc func goToSignInVC(_: UIButton) {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: false)
        }
    }
    
}
