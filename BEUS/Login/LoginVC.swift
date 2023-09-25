//
//  LoginVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

class LoginVC: UIViewController {
    
    let logo: UIImageView = UIImageView(image: UIImage(named: "Logo"))
    
    func makeSubView() {
        view.addSubview(logo)
    }
    
    func makeConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        navigationController?.isNavigationBarHidden = true
    }
}

extension LoginVC {
    
}
