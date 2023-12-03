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
    private let postImageView = UIImageView()
    private let likeImageView = UIImageView()
    private let likeLabel = UILabel()
    private let commentImageView = UIImageView()
    private let commentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PostTVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        profileImageView.do {
            $0.image = UIImage(named: "Karim")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 22
        }
        
        titleLabel.do {
            $0.text = "제목"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.text = "내용"
            $0.font = .systemFont(ofSize: 14)
            $0.numberOfLines = 4
        }
        
        postImageView.do {
            $0.image = UIImage(named: "Football")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        likeImageView.do {
            $0.image = UIImage(systemName: "hand.thumbsup.fill")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        likeLabel.do {
            $0.text = "10"
            $0.font = .systemFont(ofSize: 14)
        }
        
        commentImageView.do {
            $0.image = UIImage(systemName: "text.bubble.fill")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        commentLabel.do {
            $0.text = "4"
            $0.font = .systemFont(ofSize: 14)
        }
    }
    
    private func setLayout() {
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
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(2)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(2)
        }
    }
    
}
