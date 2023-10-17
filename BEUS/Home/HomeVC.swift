//
//  HomeVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

class HomeVC: UIViewController {
    
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
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "어떤 분야의 프로가 되고 싶으신가요?"
        questionLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        questionLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return questionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "홈"
        setLayout()
    }
    
}

extension HomeVC {
    
    func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [gradationBackground, questionLabel].forEach {
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
            contentView.heightAnchor.constraint(equalToConstant: 1000),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            gradationBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradationBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gradationBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradationBackground.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: gradationBackground.bottomAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30)
        ])
    }
    
}
