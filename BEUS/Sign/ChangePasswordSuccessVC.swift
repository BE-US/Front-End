//
//  FindPasswordSuccessVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/2/23.
//

import UIKit

class ChangePasswordSuccessVC: UIViewController {
    
    let checkImageView: UIImageView = {
        let checkImageView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)])
        checkImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        return checkImageView
    }()
    
    let changePasswordSuccessLabel1: UILabel = {
        let FindPasswordSuccessLabel1 = UILabel()
        FindPasswordSuccessLabel1.text = "비밀번호가 재설정 되었습니다!"
        FindPasswordSuccessLabel1.textAlignment = .center
        FindPasswordSuccessLabel1.font = UIFont.boldSystemFont(ofSize: 25)
        return FindPasswordSuccessLabel1
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

extension ChangePasswordSuccessVC {
    
    func makeSubView() {
        view.addSubview(checkImageView)
        view.addSubview(changePasswordSuccessLabel1)
        view.addSubview(startButton)
    }
    
    func makeConstraint() {
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        changePasswordSuccessLabel1.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkImageView.widthAnchor.constraint(equalToConstant: 90),
            checkImageView.heightAnchor.constraint(equalToConstant: 90),
            
            changePasswordSuccessLabel1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            changePasswordSuccessLabel1.topAnchor.constraint(equalTo: checkImageView.bottomAnchor, constant: 20),
            changePasswordSuccessLabel1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            changePasswordSuccessLabel1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
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
