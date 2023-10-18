//
//  MyPageVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

class MyPageVC: UIViewController {
    
    let settingButton: UIBarButtonItem = {
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(goToSettingVC(_:)))
        settingButton.tintColor = .black
        return settingButton
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    let gradationBackground: UIImageView = {
        let gradationBackground = UIImageView(image: UIImage(named: "GradationBackground"))
        return gradationBackground
    }()
    
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView(image: UIImage(named: "ProfileImageExample"))
        return profileImageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Taeri"
        nameLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return nameLabel
    }()
    
    let editProfileButton: UIButton = {
        let editProfileButton = UIButton()
        editProfileButton.setTitle("편집", for: .normal)
        editProfileButton.setTitleColor(UIColor(hex: "#C2C2C2"), for: .normal)
        editProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        editProfileButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        editProfileButton.imageView?.contentMode = .scaleAspectFit
        editProfileButton.tintColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        editProfileButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 39, bottom: 0, right: 0)
        return editProfileButton
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "내 페이지"
        navigationItem.rightBarButtonItem = settingButton
        setLayout()
    }
    
}

extension MyPageVC {
    
    func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [gradationBackground, profileImageView, nameLabel, editProfileButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 850),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            gradationBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradationBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gradationBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradationBackground.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: gradationBackground.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: gradationBackground.bottomAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            editProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func goToSettingVC(_: UIBarButtonItem) {
        
    }
    
}
