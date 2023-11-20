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
        scrollView.alwaysBounceVertical = true
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
    
    let categoryStackView: UIStackView = {
        let categoryStackView = UIStackView()
        categoryStackView.axis = .vertical
        categoryStackView.spacing = 10
        categoryStackView.distribution = .fillEqually
        var category = [["축구", "야구", "농구"],
                        ["골프", "테니스", "배드민턴"],
                        ["탁구", "배구", "수영"],
                        ["볼링", "당구", "럭비"],
                        ["육상", "핸드볼", "하키"]]
        for i in 0..<5 {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 7
            for j in 0..<3 {
                let button = UIButton(type: .system)
                button.setTitle(category[i][j], for: .normal)
                button.setTitleColor(UIColor(hex: "#979797"), for: .normal)
                button.layer.borderColor = #colorLiteral(red: 0.8797428012, green: 0.8797428012, blue: 0.8797428012, alpha: 1)
                button.layer.borderWidth = 1.0
                button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
            }
            categoryStackView.addArrangedSubview(rowStackView)
        }
        return categoryStackView
    }()
    
    let advertisement: UIImageView = {
        let Advertisement = UIImageView(image: UIImage(named: "Ad"))
        return Advertisement
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
        
        [gradationBackground, questionLabel, categoryStackView, advertisement].forEach {
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
            questionLabel.topAnchor.constraint(equalTo: gradationBackground.bottomAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            categoryStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            categoryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            categoryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            categoryStackView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            advertisement.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -83),
            advertisement.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            advertisement.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            advertisement.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func categoryButtonTapped(_ sender: UIButton) {
    }
    
}
