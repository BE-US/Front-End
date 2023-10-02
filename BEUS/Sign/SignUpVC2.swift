//
//  SignUpVC2.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/1/23.
//

import UIKit

class SignUpVC2: UIViewController {
    
    var nickNameValid: Bool = true
    var genderValid: Bool = false
    
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
        return nickNameCheckButton
    }()
    
    let genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.text = "성별"
        genderLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return genderLabel
    }()
    
    let maleButton: UIButton = {
        let maleButton = UIButton()
        maleButton.setTitle("남성", for: .normal)
        maleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        maleButton.setTitleColor(.gray, for: .normal)
        maleButton.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        maleButton.layer.cornerRadius = 20
        return maleButton
    }()
    
    let femaleButton: UIButton = {
        let femaleButton = UIButton()
        femaleButton.setTitle("여성", for: .normal)
        femaleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        femaleButton.setTitleColor(.gray, for: .normal)
        femaleButton.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        femaleButton.layer.cornerRadius = 20
        return femaleButton
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
    
    let birthDateLabel: UILabel = {
        let birthDateLabel = UILabel()
        birthDateLabel.text = "생년월일"
        birthDateLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return birthDateLabel
    }()
    
    let birthDateTextField: UITextField = {
        let birthDateTextField = UITextField()
        birthDateTextField.placeholder = "생년월일 6자리를 입력해주세요."
        birthDateTextField.backgroundColor = .systemGray6
        birthDateTextField.layer.cornerRadius = 20
        birthDateTextField.clearButtonMode = .whileEditing
        birthDateTextField.addLeftPadding()
        return birthDateTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEdit()
        view.backgroundColor = .white
        self.title = "회원가입(2/3)"
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
        view.addSubview(genderLabel)
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        view.addSubview(birthDateLabel)
        view.addSubview(birthDateTextField)
        view.addSubview(nextButton)
    }
    
    func makeConstraint() {
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nickNameCheckButton.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthDateTextField.translatesAutoresizingMaskIntoConstraints = false
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
            
            genderLabel.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            maleButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            maleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            maleButton.widthAnchor.constraint(equalToConstant: 130),
            maleButton.heightAnchor.constraint(equalToConstant: 45),
            
            femaleButton.topAnchor.constraint(equalTo: maleButton.topAnchor),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 5),
            femaleButton.widthAnchor.constraint(equalTo: maleButton.widthAnchor),
            femaleButton.heightAnchor.constraint(equalToConstant: 45),
            
            birthDateLabel.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 20),
            birthDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            birthDateTextField.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 10),
            birthDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            birthDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            birthDateTextField.heightAnchor.constraint(equalToConstant: 45),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget() {
        self.nickNameCheckButton.addTarget(self, action: #selector(nickNameCheck(_:)), for: .touchUpInside)
        self.maleButton.addTarget(self, action: #selector(maleButtonPressed(_:)), for: .touchUpInside)
        self.femaleButton.addTarget(self, action: #selector(femaleButtonPressed(_:)), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
    }
    
    @objc func nickNameCheck(_: UIButton) {
        
    }
    
    @objc func birthDateValid() -> Bool {
        if let birthDate = Int(birthDateTextField.text!) , birthDateTextField.text?.count == 6 {
            UserDefaults.standard.set(birthDate, forKey: "BirthDate")
            return true
        }
        return false
    }
    
    @objc func maleButtonPressed(_: UIButton){
        if maleButton.backgroundColor == #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1) {
            maleButton.backgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
            maleButton.setTitleColor(.white, for: .normal)
            femaleButton.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
            femaleButton.setTitleColor(.gray, for: .normal)
            UserDefaults.standard.set("Male", forKey: "Gender")
            genderValid = true
        }
    }
    
    @objc func femaleButtonPressed(_: UIButton){
        if femaleButton.backgroundColor == #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1) {
            femaleButton.backgroundColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
            femaleButton.setTitleColor(.white, for: .normal)
            maleButton.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
            maleButton.setTitleColor(.gray, for: .normal)
            UserDefaults.standard.set("Female", forKey: "Gender")
            genderValid = true
        }
    }
    
    @objc func next(_: UIButton) {
        if nickNameValid != true {
            showAlert(message: "닉네임을 다시 확인해주세요.")
            return
        }
        if genderValid != true {
            showAlert(message: "성별을 선택해주세요.")
            return
        }
        if birthDateValid() != true {
            showAlert(message: "생년월일을 다시 확인해주세요.")
        }
        self.navigationController?.pushViewController(SignUpVC3(), animated: true)
    }
    
}
