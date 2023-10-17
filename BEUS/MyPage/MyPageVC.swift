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
        
        [gradationBackground, profileImageView].forEach {
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
    }
    
    @objc func goToSettingVC(_: UIBarButtonItem) {
        
    }
    
}
