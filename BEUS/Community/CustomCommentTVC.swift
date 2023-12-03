//
//  CustomCustomTVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/3/23.
//

import UIKit

class CustomCommentTVC: UITableViewCell {
    
    static let identifier: String = "CustomCommentTVC"
    
    private let profileImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let contentLabel = UILabel()
    private let timeLabel = UILabel()
    private let ellipsisImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CustomCommentTVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        profileImageView.do {
            $0.image = UIImage(named: "Karim")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }
        
        nicknameLabel.do {
            $0.text = "카림"
            $0.font = .boldSystemFont(ofSize: 15)
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.text = "내용"
            $0.font = .systemFont(ofSize: 15)
            $0.numberOfLines = 0
        }
        
        timeLabel.do {
            $0.text = "07/08 22:17"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
            $0.numberOfLines = 1
        }
        
        ellipsisImageView.do {
            $0.image = UIImage(systemName: "ellipsis.circle")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(profileImageView, nicknameLabel, contentLabel, timeLabel, ellipsisImageView)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(30)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        ellipsisImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(17)
        }
    }
    
    func bindData(model: CustomComment) {
        profileImageView.image = model.profileImage
        nicknameLabel.text = model.nickname
        contentLabel.text = model.content
        timeLabel.text = model.time
    }
    
}
