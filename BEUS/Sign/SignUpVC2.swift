//
//  SignUpVC2.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/1/23.
//

import UIKit

class SignUpVC2: UIViewController {
    
    var nickNameValid: Bool = true
    
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

extension SignUpVC2 {
    
    func makeSubView() {
        view.addSubview(nickNameLabel)
        view.addSubview(nickNameTextField)
        view.addSubview(nickNameCheckButton)
        view.addSubview(nextButton)
    }
    
    func makeConstraint() {
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nickNameCheckButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.nickNameCheckButton.addTarget(self, action: #selector(nickNameCheck(_:)), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
    }
    
    @objc func nickNameCheck(_: UIButton) {
        
    }
    
    @objc func next(_: UIButton) {
        if nickNameValid != true {
            showAlert(message: "닉네임을 다시 확인해주세요.")
            return
        }
        self.navigationController?.pushViewController(SignUpVC3(), animated: true)
    }
    
}
