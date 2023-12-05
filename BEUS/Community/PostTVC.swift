//
//  PostTVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/3/23.
//

import UIKit

class PostTVC: UITableViewCell {
    
    static let identifier: String = "PostTVC"
    
    private let profileImageView = UIImageView()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    let postImageView = UIImageView()
    private let likeImageView = UIImageView()
    private let likeLabel = UILabel()
    private let commentImageView = UIImageView()
    private let commentLabel = UILabel()

}

extension PostTVC {
    
    func setUI1() {
        setStyle()
        setLayout1()
    }
    
    func setUI2() {
        setStyle()
        setLayout2()
    }
    
    private func setStyle() {
        profileImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 22
        }
        
        titleLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.font = .systemFont(ofSize: 14)
            $0.numberOfLines = 4
        }
        
        postImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        likeImageView.do {
            $0.image = UIImage(named: "Like")
            $0.contentMode = .scaleAspectFit
        }
        
        likeLabel.do {
            $0.text = "10"
            $0.font = .systemFont(ofSize: 14)
        }
        
        commentImageView.do {
            $0.image = UIImage(named: "Comment")
            $0.contentMode = .scaleAspectFit
        }
        
        commentLabel.do {
            $0.text = "4"
            $0.font = .systemFont(ofSize: 14)
        }
    }
    
    private func setLayout1() {
        contentView.addSubviews(profileImageView, titleLabel, contentLabel, likeImageView, likeLabel, commentImageView, commentLabel)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(25)
            $0.size.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(33)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.size.equalTo(17)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(2)
            $0.bottom.equalTo(likeImageView)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(likeImageView)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(2)
            $0.bottom.equalTo(likeImageView)
        }
    }
    
    private func setLayout2() {
        contentView.addSubviews(profileImageView, titleLabel, contentLabel, postImageView, likeImageView, likeLabel, commentImageView, commentLabel)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(25)
            $0.size.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(33)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        postImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(120)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.size.equalTo(17)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(2)
            $0.bottom.equalTo(likeImageView)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(likeImageView)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(2)
            $0.bottom.equalTo(likeImageView)
        }
    }
    
    func bindData(model: CustomPost) {
        profileImageView.image = model.profileImage
        titleLabel.text = model.title
        contentLabel.text = model.content
        likeLabel.text = "\(model.like)"
        commentLabel.text = "\(model.comment)"
    }
    
}
